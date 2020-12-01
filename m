Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CBC2CFA6D
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 09:05:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30B7C18DD;
	Sat,  5 Dec 2020 09:04:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30B7C18DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607155542;
	bh=q59sevtrMVyBZfmwzgofnPBN0fl4y3DuaE+xVTlSLcM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4iv3hhV/sJ0YglOVTv0/YXrr1PfHk5516smEkzkse9j9MSPuKu3Ozw1KPxPAH542
	 VadAZ+qkmOL51P+71O30dS3EPPNqsEk5vT9Pp5jRHdOVIwDuG63jf4hc1nA1Qm0T06
	 imbg68g/heY12wO9YI5LXZDdrLdyd5eIuRmrEcO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD747F804B2;
	Sat,  5 Dec 2020 09:03:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31EA1F80254; Tue,  1 Dec 2020 10:07:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 090B0F80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 10:06:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 090B0F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="XgfAB4iq"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71D1120770;
 Tue,  1 Dec 2020 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606813614;
 bh=q59sevtrMVyBZfmwzgofnPBN0fl4y3DuaE+xVTlSLcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XgfAB4iq6GrOnwUykFYXXLSQWM3Hb8nQE3I5w16AmX1vAcwsYbvVNLqxXABBJyohR
 WxhIH/juN4wS0UesmZl5++n+0cwzaW6re0f0fQWUTS+9GOYiyNC3h/vt7isN+YpSEK
 NluXdZy/wTZxrChjGivPiokPAChoVuRdK1aoS0n8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 92/98] ASoC: Intel: Skylake: Select hda configuration
 permissively
Date: Tue,  1 Dec 2020 09:54:09 +0100
Message-Id: <20201201084659.572055858@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201084652.827177826@linuxfoundation.org>
References: <20201201084652.827177826@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 05 Dec 2020 09:03:15 +0100
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org
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

From: Cezary Rojewski <cezary.rojewski@intel.com>

commit a66f88394a78fec9a05fa6e517e9603e8eca8363 upstream.

With _reset_link removed from the probe sequence, codec_mask at the time
skl_find_hda_machine() is invoked will always be 0, so hda machine will
never be chosen. Rather than reorganizing boot flow, be permissive about
invalid mask. codec_mask will be set to proper value during probe_work -
before skl_codec_create() ever gets called.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200305145314.32579-3-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org> # 5.4.x
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/intel/skylake/skl.c |    5 -----
 1 file changed, 5 deletions(-)

--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -480,13 +480,8 @@ static struct skl_ssp_clk skl_ssp_clks[]
 static struct snd_soc_acpi_mach *skl_find_hda_machine(struct skl_dev *skl,
 					struct snd_soc_acpi_mach *machines)
 {
-	struct hdac_bus *bus = skl_to_bus(skl);
 	struct snd_soc_acpi_mach *mach;
 
-	/* check if we have any codecs detected on bus */
-	if (bus->codec_mask == 0)
-		return NULL;
-
 	/* point to common table */
 	mach = snd_soc_acpi_intel_hda_machines;
 


