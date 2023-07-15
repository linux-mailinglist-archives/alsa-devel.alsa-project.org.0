Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE808754785
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jul 2023 10:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54CB4E0F;
	Sat, 15 Jul 2023 10:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54CB4E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689410172;
	bh=uLY0wIUjW+Zm4jswz3IcYPVkRkuC1eGdjjQQP5yC25w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E4izL+d8A8YOZZAoVgRwdlrANq3/pMgvUE60Z+oNKzDUIzDt1S7G4AbtSrEVDACna
	 9znP37mC++LXsA4eBobITca8e32armdKvHijPIffdbYmb2eNEAEvnc0nQKRdJisdYc
	 N55zZmy/jez10YJa9uaEQI7bCK3jD5HWCpRMBi1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89F8DF80587; Sat, 15 Jul 2023 10:34:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B2F6F8055C;
	Sat, 15 Jul 2023 10:34:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BEE4F80249; Sat, 15 Jul 2023 10:31:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00E41F800E4
	for <alsa-devel@alsa-project.org>; Sat, 15 Jul 2023 10:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00E41F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=Dp2qmh9c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=J3rISYPlkGFL95ndHrvljN8/6P8l+lGCoXyZ2s9OWKw=;
	t=1689409889;x=1689499889;
	b=Dp2qmh9cPdUXpAU7/RFuM3bQb7tb1EmzKwOaWvWqQj/qXXXrk2Xes5G60tSKp+2w9yYIVQ0UyPnluBjpZExjruP2rOEUjOJwT1YT38kTMcE4Vq8Qp7agOK1uVrBveduQFcEU52PZ4GRyRbDLXlqPXzbsI8Wh7cXtk7/L/RTPz0OVSTFFFfRanFxyladvAlC2Vr6/QF2kWM9j1swCRv3qV2PAlySYwCBPXZQQCMWNSPMLxPFZGLaT5Jl+wfy95R/EUtl6vGS8PTpHWLl/erZa32wGkY3g+3kJlACmMiSxqPsAABfi6wxtJlFx/7wqChjWER1gJ2CAJer8MSpgL9cWZg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qKagY-0004Hr-NP; Sat, 15 Jul 2023 11:31:27 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Astrid Rost <astrid.rost@axis.com>,
	Robert Hancock <robert.hancock@calian.com>,
	Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: simple-card: add triggers parsing from DT node
 support
Date: Sat, 15 Jul 2023 11:30:44 +0300
Message-Id: <20230715083046.108674-4-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230715083046.108674-1-fido_max@inbox.ru>
References: <20230715083046.108674-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 
 4F1203BC0FB41BD9A075ED63965291970CED0DF8012B17C85A461DE8ED8B12B5182A05F5380850401C56FA349A0FA89ADB642822489F5C4D9BC2229FC0912CDE88E8618D3BDB6166
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78CB87876C5D626D4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063727C65896DA7AF7D78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89AD385BDEC2F18500DC1904AD9B595526F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE70F3DDF2BBF19B93A9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18E5D25F19253116ADD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3D810FF210572CA4A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB24F08513AFFAC7943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A5F20180CB9673E87CBBA65E42AFBF668997DD0E2E2372F5A9F87CCE6106E1FC07E67D4AC08A07B9B0AD74539164518AE59C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A092FFDA4F57982C5F4CB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF5C7E3B0192384F5C0B061047A047A47AECE3758B57FD5B7915CD745A4DBDB80525059624982F74617BBDB0A562C82D59ED5C4DC7CCCCAF54B1EF09894B269342E4EB81C25D25832B4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojTPX5czuwuGHa0dk41um7Gg==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986B831DABEBED3DB7FCE0D28502AC75BED098CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: DL7DJQWNVNES7SBEGPGTDN7TMDFIO62F
X-Message-ID-Hash: DL7DJQWNVNES7SBEGPGTDN7TMDFIO62F
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DL7DJQWNVNES7SBEGPGTDN7TMDFIO62F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It may be useful to specify trigger-start/stop for some DMA-based
simple audio card. So add this "trigger-start/stop" device tree
entry parser.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/generic/simple-card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index a78babf44f38..f934534d5c94 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -181,6 +181,10 @@ static int simple_link_init(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	int ret;
 
+	ret = asoc_simple_parse_triggers(node, prefix, dai_link);
+	if (ret)
+		return ret;
+
 	ret = asoc_simple_parse_daifmt(dev, node, codec,
 				       prefix, &dai_link->dai_fmt);
 	if (ret < 0)
-- 
2.40.1

