Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526C8721B0
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 15:39:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75C5082C;
	Tue,  5 Mar 2024 15:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75C5082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709649559;
	bh=VqibmGC3Jl/dxCE8AV7JqAdCOckz+GBMN1nkxkHyhc8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FWNIOp3ur4yOdXm+r49tixyahTaeaCk3x/uHWIefvNeJGDKI5HlYhHywjS4WqZ9m0
	 UoRzhmDIUc3yct7DE/OxxKghSkjfoYcwtYn1rBfFTHIw2sUfpsM6mik3cUpgU9D4I6
	 YjsMychvgaSWho+oxninBOpUcUUqdnmbdrGC7BKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A960F801F5; Tue,  5 Mar 2024 15:37:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F9B0F8057A;
	Tue,  5 Mar 2024 15:37:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BB39F80579; Tue,  5 Mar 2024 15:37:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBF6FF8024E
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 15:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBF6FF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JSYcxPM0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8196EC0007;
	Tue,  5 Mar 2024 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709649419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7nOGJSWM5DMTY+8OJI5pb0eawfVnNHkYI1yq5zzD180=;
	b=JSYcxPM0+0rhLj26E5SZB3FUzzRurNnAaU1CH+3UgpdNQ6wPRIE4OKy7o/X9iaLQS3j6Ik
	tBAcgFXvpizqQJAg+YN4CVZIQOOqM5lCOe/HFuyRx/Zvy1YV5hzi8HtYccvvlfWeiLx+Iy
	IZZMkJfUurV8XVmYr+xZ/TujhXifNHOu9nfWPfUf7i/rIHGCbPAs8hhm+l6neQoES2mVT0
	uO0myHxI/y0sLaBkTHNPD7OYbMPtpej+6lKHLfE9gDDt8ETFyZoy8mUyZtTFlcGaZRDv6Y
	Zi4XdHThllDRIJ+ZZTGQTmwTserdcjXUUGC6N0ImwtGSnHVMycw38I4HHFZkzw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 05 Mar 2024 15:36:30 +0100
Subject: [PATCH v4 3/7] ASoC: core: add SOC_DOUBLE_RANGE_TLV() helper macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-rk3308-audio-codec-v4-3-312acdbe628f@bootlin.com>
References: <20240305-rk3308-audio-codec-v4-0-312acdbe628f@bootlin.com>
In-Reply-To: <20240305-rk3308-audio-codec-v4-0-312acdbe628f@bootlin.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com
Message-ID-Hash: WJD4ZDQKDNZGQMGSGDED72NDLS5KYKCL
X-Message-ID-Hash: WJD4ZDQKDNZGQMGSGDED72NDLS5KYKCL
X-MailFrom: luca.ceresoli@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJD4ZDQKDNZGQMGSGDED72NDLS5KYKCL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No macro currently allows handling a stereo control that has left and right
in the same register and whose minimum register value is not zero. Add one
that does that.

Note that even though the snd_soc_*_volsw_range() look more appropriate
given the _range suffix, they are not suitable because they don't honor the
two shift values. The snd_soc_*_volsw() look more generic and are suitable
for the task.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v4: nothing
Changed in v3: nothing

This patch is new in v2.
---
 include/sound/soc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 6defc5547ff9..7492315ce0b8 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -149,6 +149,18 @@
 		{.reg = xreg, .rreg = xreg, \
 		.shift = shift_left, .rshift = shift_right, \
 		.max = xmax, .min = xmin} }
+#define SOC_DOUBLE_RANGE_TLV(xname, xreg, xshift_left, xshift_right, xmin, xmax, \
+			     xinvert, tlv_array) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
+		  SNDRV_CTL_ELEM_ACCESS_READWRITE,\
+	.tlv.p = (tlv_array), \
+	.info = snd_soc_info_volsw, \
+	.get = snd_soc_get_volsw, .put = snd_soc_put_volsw, \
+	.private_value = (unsigned long)&(struct soc_mixer_control) \
+		{.reg = xreg, .rreg = xreg, \
+		 .shift = xshift_left, .rshift = xshift_right, \
+		 .min = xmin, .max = xmax, .invert = xinvert} }
 #define SOC_DOUBLE_R_TLV(xname, reg_left, reg_right, xshift, xmax, xinvert, tlv_array) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
 	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\

-- 
2.34.1

