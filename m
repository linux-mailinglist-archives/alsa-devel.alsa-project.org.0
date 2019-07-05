Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F88F60203
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 10:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81FF116B2;
	Fri,  5 Jul 2019 10:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81FF116B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562314706;
	bh=cezj/E93WMrKGBNnTzQBWTibtofMib/BnpAOpiGI3so=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hA4CtgIcFf+IVUiZJ9a9ZDTYC2upfhlZqBC4M/iiuvpTlulc0VQtD9Mw5Jfh5fcu1
	 ZlUJAjmRhHApN+IiE9CJMIbc8b2yUzka/eAbbGjWiGTHr+bcPGAkX0c9PFYZOzR1WH
	 fjexzesZoPeLW+Z3gbrZR6HGcwGVClvaBBcmjRIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67877F80143;
	Fri,  5 Jul 2019 10:15:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52D5EF8011F; Fri,  5 Jul 2019 04:57:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,T_PDS_NO_HELO_DNS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82746F800E7
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 04:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82746F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SqWT4LSE"
Received: by mail-pl1-x641.google.com with SMTP id i2so3883443plt.1
 for <alsa-devel@alsa-project.org>; Thu, 04 Jul 2019 19:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=69PbiH2nDR6ENHSGX1SX7mzvg/IBEPNGwMUur8Ydn8Y=;
 b=SqWT4LSERE8Un8SWCqBPl/lVC2TctRHJRA1BoSQhQc5vj+N/jt/q4KhEf46vCMxZk3
 V2gCn6rw1ZFYzREXuMI3pQIJO2pj0Gtxn/gaYGDp5uxhQHfUEpp2rfEq7R5uzFsPuC+z
 DHcAe8p5OcS5nbRZkEtbO6XOGTpo2/KPkIr0PGjiumUrEI8ZvaXXqn4cgRlAWBAOo6kW
 f5LsQpa1dPTVmIEwTxCA1fFRORx0oimeDAh4JH0HRjHD/kBF3YvCaukTg9u1mkTurrBK
 ekUnp0wg57nyKXmbNvF6cfZMzKbcyU5hv7Bn5bOgRosNcvTUnMeu0N1IBF7wWvwtQm5m
 E7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=69PbiH2nDR6ENHSGX1SX7mzvg/IBEPNGwMUur8Ydn8Y=;
 b=gzSuBNzm9V4nz3wWMm2X01TdsDxRf5SwI0LpoFPesTpv/5hDrp/GuuQmOB91Z6uxtE
 5DV0Oi7VLvaH3it8vuoBqe0NtlqqlTseXc8DliqhoiFch8Uf2FrbAArbNy+AhGcTKCIu
 mjOe0N3Ke5HBFVZyZptKxmxcSJAPmsByxh5bycqLXZXEph7TGyYOBtoSz1N+ySNouWRM
 bGrhmIpx3kt1cZJgigBoSLATYXrU+ogWPZQgz82TItqvaMgyo7HSjeHi5aTfxLNDXbv5
 h645/y5baojB3P9L0OVnIom+V/WYlAAMv8Tw/O3TD3XxW4EGAiJ5nQwOb8jwg74eZR3h
 jTzw==
X-Gm-Message-State: APjAAAWNOidUy2Cp9sO8uzCDNNyTbuMAz6qV8oOyBv4e3Dx+HWuI5ePI
 eyoLCVEsCCNDJ6zvggZxNkA=
X-Google-Smtp-Source: APXvYqyd7c2Qd36MrpCqmvjc2EFmVYZhzaqZVpuSiaYh28oJzh0oZwYb7iFcyt+x1y2ppJ3DZSVrtA==
X-Received: by 2002:a17:902:e613:: with SMTP id
 cm19mr1648503plb.299.1562295459717; 
 Thu, 04 Jul 2019 19:57:39 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.81.29])
 by smtp.gmail.com with ESMTPSA id h14sm5944246pgn.51.2019.07.04.19.57.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 19:57:39 -0700 (PDT)
Date: Fri, 5 Jul 2019 08:27:33 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Richard Fontana <rfontana@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Allison Randal <allison@lohutok.net>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Message-ID: <20190705025733.GA26285@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Fri, 05 Jul 2019 10:15:13 +0200
Subject: [alsa-devel] [PATCH] sound: pci: asihpi: Remove unneeded variable
	change
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

this patch fixes below issue reported by coccicheck
sound/pci/asihpi/asihpi.c:1558:5-11: Unneeded variable: "change". Return
"1" on line 1564

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/pci/asihpi/asihpi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index e7234f3..2a21a3d 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -1519,7 +1519,6 @@ static int snd_asihpi_volume_get(struct snd_kcontrol *kcontrol,
 static int snd_asihpi_volume_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	int change;
 	u32 h_control = kcontrol->private_value;
 	short an_gain_mB[HPI_MAX_CHANNELS];
 
@@ -1530,9 +1529,8 @@ static int snd_asihpi_volume_put(struct snd_kcontrol *kcontrol,
 	/*  change = asihpi->mixer_volume[addr][0] != left ||
 	   asihpi->mixer_volume[addr][1] != right;
 	 */
-	change = 1;
 	hpi_handle_error(hpi_volume_set_gain(h_control, an_gain_mB));
-	return change;
+	return 1;
 }
 
 static const DECLARE_TLV_DB_SCALE(db_scale_100, -10000, VOL_STEP_mB, 0);
@@ -1555,13 +1553,12 @@ static int snd_asihpi_volume_mute_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	u32 h_control = kcontrol->private_value;
-	int change = 1;
 	/* HPI currently only supports all or none muting of multichannel volume
 	ALSA Switch element has opposite sense to HPI mute: on==unmuted, off=muted
 	*/
 	int mute =  ucontrol->value.integer.value[0] ? 0 : HPI_BITMASK_ALL_CHANNELS;
 	hpi_handle_error(hpi_volume_set_mute(h_control, mute));
-	return change;
+	return 1;
 }
 
 static int snd_asihpi_volume_add(struct snd_card_asihpi *asihpi,
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
