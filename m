Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C25D2F03AF
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jan 2021 22:04:35 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BE8E173A;
	Sat,  9 Jan 2021 22:03:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BE8E173A
Authentication-Results: alsa0.perex.cz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BXpexT8S"
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C27CCF804D2;
	Sat,  9 Jan 2021 22:02:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3887FF801F5; Sat,  9 Jan 2021 22:01:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CCBBF80258
 for <alsa-devel@alsa-project.org>; Sat,  9 Jan 2021 22:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CCBBF80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="BXpexT8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610226093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0MNJdUP5Bh78YDO8qXyM8DgkIdQP3GO3KNOp3f7vR8=;
 b=BXpexT8SO35foEyfY+Bw6ADaWQdK59a2brKzy2dymNzWeMZTPhDaFjfkILMasBOzXKnWYz
 IfO9NddMRGwNECjqnDmOjKLR0p7aAmUKff0UAO0SVMzoFIw4bFvN5dqf5IYuS1cXKRTb+g
 6xR+3o6qq+D/HkULFYL5LC7enOTfyQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-N3ZRI8gKMrGj8FYy-mhiiw-1; Sat, 09 Jan 2021 16:01:30 -0500
X-MC-Unique: N3ZRI8gKMrGj8FYy-mhiiw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7043C180A097;
 Sat,  9 Jan 2021 21:01:29 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 482F160BF3;
 Sat,  9 Jan 2021 21:01:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: Intel: bytcr_rt5640: Add quirk for the Mele PCG03
 Mini PC
Date: Sat,  9 Jan 2021 22:01:19 +0100
Message-Id: <20210109210119.159032-4-hdegoede@redhat.com>
In-Reply-To: <20210109210119.159032-1-hdegoede@redhat.com>
References: <20210109210119.159032-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Rasmus Porsager <rasmus@beat.dk>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org
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

Add a quirk for the Mele PCG03 Mini PC, being a Mini PC this device
has no speakers and no internal microphone.

To make matters worse the speaker output pins are shorted (to gnd or
to each other?) and SPKVDD is provided. So trying to output sound on the
speakers leads to shorting SPKVDD, this leads to a power dip after
which the codec is an unknown state. Sometimes it drops of the i2c
bus, sometimes it does still respond to i2c transfers, but is otherwise
not functional. TL;DR: trying to use the speaker outputs on this model
is BAD.

Besides not having speakers / an internal mic, this is a Bay Trail CR
device without a CHAN package in ACPI, so we default to SSP0-AIF2 as
codec connection. But the device is actually using SSP0-AIF1, so we
need to quirk that too.

Cc: Rasmus Porsager <rasmus@beat.dk>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 48d781faded1..2dee84578b90 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -620,6 +620,15 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* Mele PCG03 Mini PC */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Mini PC"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "Mini PC"),
+		},
+		.driver_data = (void *)(BYT_RT5640_NO_INTERNAL_MIC_MAP |
+					BYT_RT5640_NO_SPEAKERS |
+					BYT_RT5640_SSP0_AIF1),
+	},
 	{	/* MPMAN Converter 9, similar hw as the I.T.Works TW891 2-in-1 */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "MPMAN"),
-- 
2.28.0

