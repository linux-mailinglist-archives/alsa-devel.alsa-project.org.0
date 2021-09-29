Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB00B41C163
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 11:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD99B16A0;
	Wed, 29 Sep 2021 11:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD99B16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632906795;
	bh=TCBJgBc6BPU2GchKm4rYKtspIxdJJctyTZ4TzXk8r9Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GTLwVioDKnp46mpyAeQ1GQ7ioZ/BJIOg7Sb+Djf4zjYCEnAsmG0UTYODG96IzoyvU
	 ID8FgstgwWE9shs9uoFPmVFYfyS8bNoGZwOIdVDKZQRYexqc9XNEXHrRVSMR2JxBzQ
	 +FJ0EmJZpaLupKrnqQ/6MKIKghU5lp5DgU4Y6KCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46BA6F80272;
	Wed, 29 Sep 2021 11:11:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0B70F801F7; Wed, 29 Sep 2021 11:11:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A773F80161
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 11:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A773F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="RWzhXZsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632906710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TCBJgBc6BPU2GchKm4rYKtspIxdJJctyTZ4TzXk8r9Q=;
 b=RWzhXZsMkwlc8VBsQ4Y4TXcSDbWkaWmwQ8zuu2MnMA6YofmkFI9f97PLwA8a/nc7bcjdIY
 LzURUVwncmvUnfW/wtF412WtOxF43YeG+iXpCOUFeCoMvpcKjSDuHVy7WtVvHCZNQqjoMy
 oUw+542xJjFk40dAlwgjGAiGTQ5Rvd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-cz03vND1NKanDpyrQDzj3g-1; Wed, 29 Sep 2021 05:11:48 -0400
X-MC-Unique: cz03vND1NKanDpyrQDzj3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E3A2802936;
 Wed, 29 Sep 2021 09:11:47 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16DB81017CE3;
 Wed, 29 Sep 2021 09:11:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 0/5] bytcr-rt5640: Fixes and improvements
Date: Wed, 29 Sep 2021 11:11:39 +0200
Message-Id: <20210929091144.4778-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Hi Jaroslav,

Here is a patch series with 2 bug-fixes for X86 devices with a rt5640
codec (these 2 are a resend) + 3 patches adding support for the second
headset-jack (on the dock) found on the HP elitepad 1000 G2.

The new kernel-bits for the second headset-jack have already landed,
so this is ready for merging.

Regards,

Hans

