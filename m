Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E34F20C9
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 04:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 077BE16B1;
	Tue,  5 Apr 2022 04:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 077BE16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649124508;
	bh=32PE4O4nBl/jxPF/CIjYIYZqU/XAfE8wn2/s1dz+qm8=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcJyVKroSXy/HugOgGZaZa8QF185uo0lefdelx3aFHz9j+ieF+Yjbja15K/F5dvMd
	 s/ZyU/MnZjtxpfYqGEBmTTertOorEOzA4UsTPUIMbgyTzjB68+5JEeB8/2lAZ478Gd
	 XlLvUHI3gUI0c6fXAEZ0tlyFZPN9FwfTJ/4KbuZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22D8EF80528;
	Tue,  5 Apr 2022 04:06:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A074F80527; Tue,  5 Apr 2022 04:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::705])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC80AF8051E
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 04:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC80AF8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="iPO6jom/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xj06zKMAYb91yHrASI8sirDsCdw50ReF8Roz2kGW0Tl5vsTshRKHSJbOOmmtxLuFuDrAQxpjfeJPrLttUHW+dMSoPpNM5i+tIeFLSii3yivo5AlVTmMN7+QniEbPylsTN2ZZn34mzvPN6RdBc7Pg+zfxhLXclU80PQYcvxS4UMg0sY8OqVuyDYkAJnoZQWo7akkFU2ORvU5IOG7XH8VR5V4E7okRPLMn/mES+CIysS7KyUnr0MwjgIeWDN8mKPA6rzEwLVpr3htMPsUBxhmHL2Q/66Kv0Pv2NeYVGOuvImyQIjhOwIJdBrPp4w7De5VgAQ6qQ/LZPNpnyOe3jJae7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyRk0qHDEfjAParae6bdrNpiVVw3XeMddVt5IIWZEKc=;
 b=AxVdKdgx8sglCK0vKs+U3xOXsx4hSxModpLq9hQ+CcOBTmlOQFdu8wVdf26a9DIfE3OdoXL8KQ1WIEBfoXU0vsiKXUpnx65Q0OwArTxgvZTGjYpI6XINIW88zkNxzC5NPpjzjlitidvDz+wn5R+zo5nzguLMW2HfyQKiezV/iH9kU9Jd9xC+J/HjSgHn3+PflHoIVwOyHFj2kW0wtmTfICze1z1rRk7CjmmWaS19CCoOv6eVI1yBUSLwwbVglmyXPlNkAXYRsspTkX4clV6JH2IvMHtTH9k6ffcWVZsuzhdCd0+wNZwT9++6IAfS+jDrJ5OGGELTR9Ca5/gvTvQ+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyRk0qHDEfjAParae6bdrNpiVVw3XeMddVt5IIWZEKc=;
 b=iPO6jom/DTitUSTEB0JTkOamY5NsVK8ygPZ0FiJncoreo9SUogyuvVQpnOnKM4vPMzCHlsPhf0W/aR1bS/44LiQBdwU7ZA3wYkILrXYfAPm0N+cQtFBkVQRX58gHJ8kXjKN9SHpKfRyc0H5dXtrBPXC9w7bR2LbOpp71s1XMxEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8525.jpnprd01.prod.outlook.com (2603:1096:400:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Tue, 5 Apr
 2022 02:06:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 02:06:34 +0000
Message-ID: <87bkxgp9lh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/6] ASoC: ak4613: priv has ctrl1 instead of iface
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Apr 2022 02:06:34 +0000
X-ClientProxiedBy: TYAPR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:404:28::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fceb42d-8df1-49e5-bf7d-08da16a8e8e6
X-MS-TrafficTypeDiagnostic: TYWPR01MB8525:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB8525515BD1CA6F3EF9D000BBD4E49@TYWPR01MB8525.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UCYdCoyGHUmHHuS+8Y/2wKZwwD4iQxmhUwhuQ2h2LAM+v5XilPxgyp0N6K/6rtZHbzzMt6wmvd7a18+CjWpeh3RVJvf1fc7g6HxB++dKYFAv0q0TSB4LX2GCptwJtDpg8+TlFS7zzG5Ub9wAOW26t6VVyZEy8ApIgqSFclahyR6mT0n0ELjbZJ+yc1s0sx1kaksr2x4Mqh1zZRvV42paYa7w0UsOQWuK/CTrGpcPWc2bcsvMQtrV4tu2C0Xcv2EuYHNj31GgZQTuUT9gWyuChXLSxXVN2KwWPIwaoRvHiYia4usOWrrQEcFQVnZjNIHSWS0/Sii6k75frEgQiT9CYseuh4Lyj3JaZWsWzf9DDdsv7apQAreXlhK3nRdFBTfJLMzADkOI7DX1zYFz+UNogTJnOUQEcHGy4p6Wy3cUG7XIJUyOoOp13VxVjoxsOiysujeNlCxd9sf5hPCLUjrsR7JOZdWkn/keFsHvuOqAkHEgUuVRLtJh/Zx2dNLexYxyXvpPCWXCE3hoQZwDSOe3oNPk4r71kvbQskg1+fa/iZ1U95zu+yeYe3yX+DnP2O9amH4cRMYzcvZ5iQY4UcbzDrFk5X90FE86b4Cv1ltYp4ssFClbQ7rjwZR7xwDLm8H87RoYY4nbWOfFe8D6b0vyvNRg9CxKmBgo3ABxpaLdyBdP7/QinPeVewiY6umyDSk4aGtVcC3dkZTOoLRSQfqkvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(8936002)(5660300002)(36756003)(6486002)(2906002)(316002)(66946007)(66556008)(6916009)(66476007)(508600001)(6512007)(2616005)(186003)(38350700002)(86362001)(26005)(83380400001)(52116002)(38100700002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hpVexd2T+6pz7GL8cGS3+/G9l8iZ/65Id126429eZGXy3eKBBqM9iLqsxk9Z?=
 =?us-ascii?Q?BxQS7RlXEWhiBHnIdku56Z1YM3Mfjk3xXZvbCp7/XfCqiCb/e/M9j0fpOoMP?=
 =?us-ascii?Q?0KXBRzEbsBNB0MG84U4Gh9orGxHjHkdEm7XiIKBfRgLzKIUKaO147o9ZENix?=
 =?us-ascii?Q?YNb9w0Hc69sBx1Oo/fxAmiUkXbH1xYJogOugYIW7I5ld4nFYdN6nSE9BsEGn?=
 =?us-ascii?Q?NGuV7lbIqrTKlSOwEVYKjFcKC/oY6EG8hHjJOzrX6U168eXRsmPNk+AZwIqj?=
 =?us-ascii?Q?VtYlUaIv0enGSufr8a/1v8SyRCaSLeiCWSzKh6Yis664KkDaJJN7pkjfFhRT?=
 =?us-ascii?Q?25eDUbZhVvIYg6Xvse4ilpJOxmseojIfR5lP3mB+0TkgYDVyhFARWNfzppoU?=
 =?us-ascii?Q?hKovqbKHnGUFWKyutBon4kmH6lOGuXgNj1sg/vscyvnu8eu0DwU6ayaqX7ul?=
 =?us-ascii?Q?C2rMHchrfF6YzsYeLBeR0/1nsyJGo9UQJbw1RAGfrL2GqPFUP5cqEqkzb7uA?=
 =?us-ascii?Q?oxwylYLX/Jyr25MiKpiqbZJUkf6qP8JuRkvI0nc8kKG68eZhIw3Fhw5oMfUz?=
 =?us-ascii?Q?oEiDetN9WUrPj2X90he/y2S5YxeBoR5s3ZXAdJGxAzxDW6J4SX0JqarHH83u?=
 =?us-ascii?Q?/+WJ4nRMhCqLof1J2kA8dvKmuFk1t0wdApWtTq8Ra50+goLIWIYIO7uDKTmP?=
 =?us-ascii?Q?EHbuiNctigQlNtA1a5AOJaZvW8MfVNCbghTcshVI5+x/klB43uxKoWe2LJar?=
 =?us-ascii?Q?VJJV+MKp22B7tj2U0frON2Ho1Z+p54CA4XxVK73RWAl2VTIfyEn8oJ6XxuGx?=
 =?us-ascii?Q?xg2r0uYHGR965N2Pl/0A0HSIyga4kVgwk25NWnkSsTOEf86aH+wiOo7Ks34H?=
 =?us-ascii?Q?5Q7m/cQNunX7aFotOYUvjPkN40djNJY3Q2cWUlB160QyipCm0FGFKTVfAnYk?=
 =?us-ascii?Q?SkrBILeUJNmlX98ruT0199NjQ7Dvy1VkAWYwOD+mDOACn7S6xKT6fXumFD42?=
 =?us-ascii?Q?ErbOqnJ7Ij4eShNln1oSfclSwaTs268GLi99en5YLE6Ls4060gdWNg8ThDWF?=
 =?us-ascii?Q?R4qccGuAKJ6fGxRjXMVMILxBGgJl5F2AmzUnf9Fp57mdeAgMASq2S2nuTIsz?=
 =?us-ascii?Q?miX2Av5lod0x6IXnLOvDjlutoyQ+8IKiZ6HuJJuZTyE558/yQZcrt47XlfwD?=
 =?us-ascii?Q?RCbbf74xZyCY6HQU3w3e+5qgl9BSobWKicZM/hgRIJ2EjA5fhn3zaG1ErkuZ?=
 =?us-ascii?Q?5PVO/pSl3QlGQVxpWXGGcCDEfIsvJMzwqll58vhXKhw5v9wE/X/xlrL6sv9D?=
 =?us-ascii?Q?IFpoayFKP8SNvy/BhpY6VjvbMIHJmXqI7Bycc5zADNsBrqP0acXWzcikzz+i?=
 =?us-ascii?Q?oIlQiYpu9rgXJ9tzUXvqtzI7qdaPfxUibMeqRXuUFCQL+ymWxrBJ+WAmPOme?=
 =?us-ascii?Q?iKGwNI5DljdgEILbNrrc3WZfBQ27Oxx3vlk9H8Am8j6dzNlEHLSC0TyIAE+w?=
 =?us-ascii?Q?x6bdkkzrPd8lXfbjk5uWaS8bQQcRl1vYNgnM4iu3i1UD+IHLM0XeRg2l8E3e?=
 =?us-ascii?Q?LSI/jbQ/MtSpTbcsijljEIU9OqulqRdIW5coS3jCW/1wZbnmw+8/97ukf1md?=
 =?us-ascii?Q?D0hLAib74iUh/UGUlKLDsoBYyd+jclY91dAhQYQPY3SLQ3aZz3d9/B/SNVnX?=
 =?us-ascii?Q?I6SocXVQg360Ho2NnfiaKeZf9IRKE5fhjtJX1HBaYN0Cmxs/iRoTf/uoZ2kS?=
 =?us-ascii?Q?pYmczK0O/lMyGVBmJiiNaZsXHRRpgkrpzd6PsxReOuJ84n2sPd0I?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fceb42d-8df1-49e5-bf7d-08da16a8e8e6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 02:06:34.5193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5pTZSErK8EmdeEfZybdRig5QLLiTyYXTTK4JGXpAEF6/egwGdPIK0x6dj5Ps2Qbyh+3rwZxZYa4JIKUIR3sKvkmbd9u4CQfVISU+LR7hPHf0xILcyDZq7aVJYXj8Zd3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8525
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current priv is using ->iface, but it is not good match
to support TDM. This patch adds ->ctrl1 instead of it.
This is prepare for TDM support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4613.c | 61 ++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index b19c7c4a1971..73fae6ffe92b 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -86,7 +86,6 @@ struct ak4613_interface {
 
 struct ak4613_priv {
 	struct mutex lock;
-	const struct ak4613_interface *iface;
 	struct snd_pcm_hw_constraint_list constraint;
 	struct work_struct dummy_write_work;
 	struct snd_soc_component *component;
@@ -94,9 +93,10 @@ struct ak4613_priv {
 	unsigned int sysclk;
 
 	unsigned int fmt;
+	int cnt;
+	u8 ctrl1;
 	u8 oc;
 	u8 ic;
-	int cnt;
 };
 
 /*
@@ -138,9 +138,9 @@ static const struct reg_default ak4613_reg[] = {
  * see
  *	Table 11/12/13/14
  */
-#define AUDIO_IFACE(_val, _width, _fmt) \
+#define AUDIO_IFACE(_dif, _width, _fmt)		\
 	{					\
-		.dif	= (_val << 3),		\
+		.dif	= _dif,			\
 		.width	= _width,		\
 		.fmt	= SND_SOC_DAIFMT_##_fmt,\
 	}
@@ -255,7 +255,7 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 		priv->cnt = 0;
 	}
 	if (!priv->cnt)
-		priv->iface = NULL;
+		priv->ctrl1 = 0;
 	mutex_unlock(&priv->lock);
 }
 
@@ -361,23 +361,12 @@ static int ak4613_dai_set_fmt(struct snd_soc_dai *dai, unsigned int format)
 	return 0;
 }
 
-static bool ak4613_dai_fmt_matching(const struct ak4613_interface *iface,
-				    unsigned int fmt, unsigned int width)
-{
-	if ((iface->fmt		== fmt) &&
-	    (iface->width	== width))
-		return true;
-
-	return false;
-}
-
 static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
-	const struct ak4613_interface *iface;
 	struct device *dev = component->dev;
 	unsigned int width = params_width(params);
 	unsigned int fmt = priv->fmt;
@@ -412,33 +401,39 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	 * It doesn't support TDM at this point
 	 */
 	ret = -EINVAL;
-	iface = NULL;
 
 	mutex_lock(&priv->lock);
-	if (priv->iface) {
-		if (ak4613_dai_fmt_matching(priv->iface, fmt, width))
-			iface = priv->iface;
+	if (priv->cnt > 1) {
+		/*
+		 * If it was already working, use current priv->ctrl1
+		 */
+		ret = 0;
 	} else {
+		/*
+		 * It is not yet working,
+		 */
 		for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
-			if (!ak4613_dai_fmt_matching(ak4613_iface + i,
-						     fmt, width))
-				continue;
-			iface = ak4613_iface + i;
-			break;
+			const struct ak4613_interface *iface = ak4613_iface + i;
+
+			if ((iface->fmt == fmt) && (iface->width == width)) {
+				/*
+				 * Ctrl1
+				 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
+				 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
+				 *            < iface->dif >
+				 */
+				priv->ctrl1 = (iface->dif << 3);
+				ret = 0;
+				break;
+			}
 		}
 	}
-
-	if ((priv->iface == NULL) ||
-	    (priv->iface == iface)) {
-		priv->iface = iface;
-		ret = 0;
-	}
 	mutex_unlock(&priv->lock);
 
 	if (ret < 0)
 		goto hw_params_end;
 
-	snd_soc_component_update_bits(component, CTRL1, FMT_MASK, iface->dif);
+	snd_soc_component_update_bits(component, CTRL1, FMT_MASK, priv->ctrl1);
 	snd_soc_component_update_bits(component, CTRL2, DFS_MASK, ctrl2);
 
 	snd_soc_component_update_bits(component, ICTRL, ICTRL_MASK, priv->ic);
@@ -675,7 +670,7 @@ static int ak4613_i2c_probe(struct i2c_client *i2c,
 
 	ak4613_parse_of(priv, dev);
 
-	priv->iface		= NULL;
+	priv->ctrl1		= 0;
 	priv->cnt		= 0;
 	priv->sysclk		= 0;
 	INIT_WORK(&priv->dummy_write_work, ak4613_dummy_write);
-- 
2.25.1

