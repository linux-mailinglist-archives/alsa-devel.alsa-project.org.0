Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D20573479A5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 14:32:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A2471691;
	Wed, 24 Mar 2021 14:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A2471691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616592732;
	bh=l2tX2VskGm9EY5UscBvlLfVyyM9IdpPX3J15c7+2rG0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LrNvgvsB+V2uvaoUwQoRncmdZke40+I7NQLg0r2tji7omfGxHuPhVI6iLmHao/Kih
	 4K6F2y8ZX/P8OSYqCXQABKkgg4s/PuAID5FWvLx/saFm5XAv8PeulAihs/PjTvVwtL
	 GKuy1BRXZl132Ne2oiUO7i0G8mjSqCRCCm/vuvtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23CACF80240;
	Wed, 24 Mar 2021 14:31:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E10B2F8032C; Wed, 24 Mar 2021 14:31:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B5DF8012B
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 14:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B5DF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Fip98KII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616592667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PFCTSTdITl6SUvpKwZhc0aMbxho1+Vz9X6PKOhGoZPA=;
 b=Fip98KIIqPtIl7qQrLj6maDl01w2zxHqcMgUDxyfFLrZWrThql6yX+AklrTpqi14ZZcZKM
 +9AFHaJe+CFvPeMk+xcXCzdeD9HgSAQ0RSePnjPWZVpZcG5lvwT4l+dg0viDcBFS6l8jN7
 HaYhuRm3540E1aU1KS/ehRM2gsdFELY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-egz1etcvNbil_dhXKuRcbA-1; Wed, 24 Mar 2021 09:31:04 -0400
X-MC-Unique: egz1etcvNbil_dhXKuRcbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5AED87504F;
 Wed, 24 Mar 2021 13:27:14 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-209.ams2.redhat.com [10.36.112.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6AEA2B0DC;
 Wed, 24 Mar 2021 13:27:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] ASoC: intel: atom: 2 bug-fixes for the atom SST driver
Date: Wed, 24 Mar 2021 14:27:09 +0100
Message-Id: <20210324132711.216152-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi All,

Here is v2 of my bugfix series for the ASoC Intel Atom SST driver.

The patches are unchanged except for adding Pierre-Louis' Acked-By and
adding a fixed (subject fixed) version of the Fixes: tag which
Pierre-Louis suggested.

The first patch fixes a bug which is causing audio to now work with
pipewire and both Fedora and Arch Linux are moving towards using
pipewire as the default sound-server.

As such it would be good if we can get these 2 bugfixes added to
a 5.12-rc# release.

Regards,

Hans


Hans de Goede (2):
  ASoC: intel: atom: Stop advertising non working S24LE support
  ASoC: intel: atom: Remove 44100 sample-rate from the media and
    deep-buffer DAI descriptions

 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.30.2

