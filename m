Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3962D04C4
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 13:27:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 817771796;
	Sun,  6 Dec 2020 13:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 817771796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607257638;
	bh=sBFqxeE8ZmnxxyLYsKrdqfUY6v+4jEPcmR9OxH9f5Qo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dd+BSXMqxoqWjwGC4pwNqAwSiJXHKMl4RWUwng1e15q4mU0e5YxgnT90fZo8nBDY9
	 iB+s8LfuLKDD7wBsxX7B5f2fCAcS3aRE2e00Zgg7Qi8EznwM63PCLLJMrT01A3H9ZD
	 TP9+OtKqgiLPnM4GkaRL7ag6H2IGLRhoT29qHjjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7456BF804BD;
	Sun,  6 Dec 2020 13:24:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48045F8015F; Sun,  6 Dec 2020 13:24:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE3FF8015F
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 13:24:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE3FF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="VK/3OQOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607257483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sBFqxeE8ZmnxxyLYsKrdqfUY6v+4jEPcmR9OxH9f5Qo=;
 b=VK/3OQObT5k3EjcXUbXWmT7kb4PJj9p0rGYOqkUToz+jhIG2lL9sckdJxrY3pdjIpaWrON
 jbClo3FX7zt2Gp9CNL1k+yN2AFsFEcYxEUDdcz+H1hgCZ8zYx2FVARfPOfM7qSamfVLGE1
 NUPsOnm1m540yudeNp03pJu4FxT1DrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-Dlhfu3eGOoq-G9mzLrPb-g-1; Sun, 06 Dec 2020 07:24:41 -0500
X-MC-Unique: Dlhfu3eGOoq-G9mzLrPb-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FCE3800D53;
 Sun,  6 Dec 2020 12:24:39 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A66865D6A8;
 Sun,  6 Dec 2020 12:24:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: Intel: cht_bsw_nau8824: 2 fixes for usage with
 sof-audio-acpi
Date: Sun,  6 Dec 2020 13:24:34 +0100
Message-Id: <20201206122436.13553-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Here are 2 simple fixes which are necessary to make the
cht_bsw_nau8824 machine driver work together with the
sof-audio-acpi driver.

Note that atm the sof topology files are missing a .tplg
file for this setup. Simply copying over the standard
sof-byte-codec.tplg file does the trick, but then some
mixer setting changes are necessary to fix the right
speaker/headphones channel not working; and those mixer
settings break the right channel when used with the
sst-acpi driver.

I've been trying to fix this at the tplg level so that
we do not need to change the mixer settings, but no luck
sofar. I'll post a RFC with the topology changes which
I have and we can discuss this further there.

These 2 simple fixes are necessary to make the sof-audio-acpi
driver work regardless of the topology issue.

Regards,

Hans


