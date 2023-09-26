Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A3D7AE5B7
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7787DEB;
	Tue, 26 Sep 2023 08:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7787DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709352;
	bh=ePtwWAzaQSDRMPkQJqThVJATn+XDbco3CaYJMBtFfo0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NvSY7VYQZdPZVlGNMkMjzpEw9VBYiMMDFb4XYQCiJfQHK53YAUueuO7YsdmdLJVbn
	 Rjm0QUXY0MRQaP8oSCohgFx4oHw2OeVTJokoDJcxsTviT/gmy9LzaLxf0Yt/zbRulf
	 MnobIL59KpyytVCYXU88wKC0/uqR2+qns7ssC5jo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AE0EF80580; Tue, 26 Sep 2023 08:21:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D34F8057B;
	Tue, 26 Sep 2023 08:20:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D388F80580; Tue, 26 Sep 2023 08:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A53C0F80571
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A53C0F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=W1Eap+9M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XG/X5Nhx/cqWBQe5Rc6yxVy9yYb1yqm6swDpqMMfCWGAZNDfyb9op3RcV80nWBZZQGd180EamVoRTgeUOqgAvToBukWEjbjYq37NIKwdXwHho4NOkpM8XNfut2NXUdnWT/u5qowzzFQzwK8DDecYXw4UBG0ZuwP+Vexk6+pO896MyL/JvC1ic1UfKDWGB4K1USHhmVUC8MhpilMuPccXQaOqLHBKHqW6/MH+ex5qDQk2K9GaFi7uzpeRQR7u81qOhryM6aLakRA67lBEeauqq1pZinzBCVrFIvsAGsPbJzhvU+RqBQWuvB9M4U2qAOGfe2oQJ9PdmwLAY6BVz30zrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JD6q9HmtdD0KL3f6LNrfVck2CSTBjPrphF1LXAQvL8=;
 b=cfhZBx1zgQpSFWKiwa+KM0ftom88RzHpjLhY995yZjZFYVz9BkFnoY5EYKw2+poqfMbk4X4H76SpTrGhGz6HF1GqgLulKzgsjQ8a6az/Yj/bsWFWNw8dPZbuFDbVLxqYYGcK99mAbPB+rV62lqjUObKjuA0O3reBO7e24U+XmmYFn5UBgimCYECMY2XDkrxXTcSvcO8KFGDt565ai9eOH0r/TWIW0UNBXiVbjzKVN/u20ojLhkra4fF9G7ZwA5+XqAv9R8Lpgy0CvADe19nDYMNgql0lCT8Rm8ltFbZbKYw8+u7x3IfrU8xIYxd0RyLdLCbK2nmneDw/0BOBToNdKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JD6q9HmtdD0KL3f6LNrfVck2CSTBjPrphF1LXAQvL8=;
 b=W1Eap+9MifUiNE4lFGDALLsIsbN6LwzG3bS5lRXztgOBz7J34VjWJ7CgqsveJgOax8yacRKrU3jWKe+lJ9qdjezjVRFo5l1MXtt+uiT44nfTo6YNg0ceBXBxA+Gf0Fgf+GT9ldJBDUzE3sdyucfNvN4ZrVI9fsWcwa3UxFIG6og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:20:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:20:45 +0000
Message-ID: <878r8tihfn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Arnd Bergmann <arnd@arndb.de>, Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 04/54] ASoC: ti: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:20:44 +0000
X-ClientProxiedBy: TYCPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9259813c-56d8-4a01-8b1a-08dbbe58b75c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HFN1Gw03XPz5cC8m4F/k/Hc1DJpS8RLrEslNHnP00g0231K8gzVGjbm9vryqTEpN+vZFJVpSodOSZwUyT6G4lqPb56Zr8SSSDkRhsnuw2Kn1o5tvodPOoQN7DkYcQca+taTnORXAeQIPkKBLzeCInDZroyR7zcTey8pmTWHX4Z/5w6184vSu7Xc0vPD/KqpIfJ+g6FxsMAmm8DfdPdqyoPxjlZyPIwx+BkNF0Sfnni3KfonU779dJi58LcXwRLnt+JR1vvWvXbXKpDeJy4zbvqk1thbatmjz7imZk0TMlsI15EQ+C7sUnLFBYaw3oHGI8Syh3PG8FOFjX1s8Q2hxaWE1l+FnYCWSmljgNdDpWWTZlFdvBrC/phw/N3DGiGGtuF3Uh5X72cvkoVDcwD8OYdpJnO6Z7a6d/Mb2HiXr+qsOCt84H86Es4DDvyfzYD/XeArASq1G7WHgNIsrehtF7F0k7g7KxKPZ+/PnQzLeHzw7NyfMHpEe5r9jaHCDerDWdUUcajNpOvm1b06Fj6yx/AJcuYqjBanXrad/mOhgdJCioSJ2uIkBR5ZW47my3wcIoxyZO24qxwwf0zqB0PUCuVB1aeFDtN0Zw1UlkAVaIdtS4wIv+X+e/Pkyfr8+/QvWS8+zd71UoM7sMQ/ld7cYkQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(30864003)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jdzc6p+SaKvmwgXCi7oc5ZAuv+zDAlWICPpRjobETturhU5Zr+suLhfLKL5A?=
 =?us-ascii?Q?s7jgC8u4/ggdPYoO78zVs3RBwT6teVnKEPj6fMjszkMWLhcHkPrhaTnP9OyZ?=
 =?us-ascii?Q?CKxNUXNFPBKh24M3DkWMdSxq5ICoN45tyX+eEJQP3rTwsadbTaioTI4/w5F2?=
 =?us-ascii?Q?vBTv0EKRI12WHNtx2hdS9vK4YmU63K84zGfI01kSWYxpUI3ipoTrZyDOjn4w?=
 =?us-ascii?Q?ERkppWLmewRhQLEzK0PxabXx8O+EMmakjluvhOcECmI9cBl2oISoEdSwrp24?=
 =?us-ascii?Q?ED5lMBAE3fX+LRX/z8S750HJe6Wsdw42uXWgglPhcJZBbR/04HSAPuyQrveB?=
 =?us-ascii?Q?nz/rgBTqawVJ31cA2/BX0AgML2CqFsqYWrlhj67Ew0PCx4uGUIHHznQVvDu5?=
 =?us-ascii?Q?a1ycZA+iEFhB4KBaISHSiJDf60jq0GTfdmDBhQ8d6sWJqwmocyvdgLeKZau1?=
 =?us-ascii?Q?R9pq1wp6XRSv4gDOzkdyxHr7OqeoEOrWGe1duksFIqIEdEjq/CLEPe9WE2/l?=
 =?us-ascii?Q?77wc0A6eHSfUkyotbMu58WkWxsy+fmiBJjibmoqZzJZCrWd0IxXwjis3ppAv?=
 =?us-ascii?Q?ix1QYBu3GDGKqqdGGQas+Qc1WqkiTjOc3W0ezCEuk7bMxSim/cttuEty6sU1?=
 =?us-ascii?Q?p/rUMCG8irQvd/q86xf739ITtIzPdGCB4tynKMeE6pKCBCz3aID0wczBsxTI?=
 =?us-ascii?Q?dGGDCSbu7boRTQCJJKY82XM7jjQqmaSXidxImezHwPsiP7znz1uQgpG702Mc?=
 =?us-ascii?Q?h0VImDoaS0uDwSy2T6h/c7+OFeki3D8ERGWZ5rVPGmLjb5FXl8ptKrljCNc5?=
 =?us-ascii?Q?Ea66H2EJvPmdCMuw+734dedgOdw329XSjxbFZNJtHnMjSxWOl8k0ZjDn8AiC?=
 =?us-ascii?Q?4Z58ED3IYFb4WZTqdxizDhaAkx/JwtdsLExX4YgnyTD0LZsY3XCFVM+HctUc?=
 =?us-ascii?Q?nEI5xKaMVunxtaRH6gWCtSWiqJwbfgdkCTzRcO9KanySdzyaSbcQOjtjNO3x?=
 =?us-ascii?Q?3T/v/1f3XUrrgWRWQgx/acJ6doZdr571a4u0WCeyIYi9ccv1u+8KwrMFHhOi?=
 =?us-ascii?Q?MTxEjEmhTrXyfzpNLPUIGDOH7wsyiJQK9bvIAZ8GS4pS+athr1kX9XEjS5n1?=
 =?us-ascii?Q?ggoxBlITCelKn/jiuRASYUfodjoIv/s4q4wFz1rALlkNZ2VFLcAdiI0DjIv0?=
 =?us-ascii?Q?bLCrmrH1XoAVPKypqy3yCI7x/7tCqwEUxdB9KWudOPuge0tMrOqe2Sr5EcIy?=
 =?us-ascii?Q?kWLhjM5rqTz8o8Ykiu6YmnE8DJy4NlLCuxH8AIMq3whkDS5PtQIUXaiUCXfi?=
 =?us-ascii?Q?IqCn5WueCVUOp1i6AfnRY3qu9Q5hKFM7S1m5K3j5UdCWv/Ac08F3oblyV4mU?=
 =?us-ascii?Q?RE/+5w6mFtWWeYTxXQnmFH5pvlxaBOHkYZGu5/doCWLg8hHVCMAFbcPibxtm?=
 =?us-ascii?Q?crV0JXhHELu3bcWF3CbZYAJlvTt92lb6eztfYBph9Tt7Rv0L3z8oczlDgeaR?=
 =?us-ascii?Q?CsidA6L9Z4yD2xRIot6QoQCZQVdcB0w4Ejl3kqRxtVhjkFZ4hnt7RGwIVaRC?=
 =?us-ascii?Q?UestQDU3OCRBncVmj4izXPBlEeiySAAoBi+Vj03a/VbRL70NVs0YJo6wP6od?=
 =?us-ascii?Q?hardWCGyuSALSGX2+eIlsYY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9259813c-56d8-4a01-8b1a-08dbbe58b75c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:20:45.0672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tT+N8sTCCca87WHHzAGbx5GYXRH0CbW7jU7wufgEimcRGY6Qvwnz+J+SH+ZxEyDOWV1q1rab9pZQ+1C+0rr0li1RyNsTRdas0vmariVK55NDr1f9CUV/KGOANjV7Lifu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: GR6NXDIR35XVLVB4KYTPQSUIH2AWCJLV
X-Message-ID-Hash: GR6NXDIR35XVLVB4KYTPQSUIH2AWCJLV
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GR6NXDIR35XVLVB4KYTPQSUIH2AWCJLV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/ams-delta.c        |  4 ++--
 sound/soc/ti/davinci-evm.c      | 10 +++++-----
 sound/soc/ti/j721e-evm.c        | 12 ++++++------
 sound/soc/ti/n810.c             |  6 +++---
 sound/soc/ti/omap-abe-twl6040.c | 10 +++++-----
 sound/soc/ti/omap-hdmi.c        |  2 +-
 sound/soc/ti/omap-mcbsp-st.c    |  2 +-
 sound/soc/ti/omap-mcbsp.c       |  8 ++++----
 sound/soc/ti/omap-mcpdm.c       |  2 +-
 sound/soc/ti/omap-twl4030.c     |  2 +-
 sound/soc/ti/omap3pandora.c     |  6 +++---
 sound/soc/ti/osk5912.c          |  4 ++--
 sound/soc/ti/rx51.c             |  6 +++---
 13 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 371943350fdf..687c1d969285 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -460,14 +460,14 @@ static void ams_delta_shutdown(struct snd_pcm_substream *substream)
 
 static int ams_delta_cx20442_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dapm_context *dapm = &card->dapm;
 	int ret;
 	/* Codec is ready, now add/activate board specific controls */
 
 	/* Store a pointer to the codec structure for tty ldisc use */
-	cx20442_codec = asoc_rtd_to_codec(rtd, 0)->component;
+	cx20442_codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/* Add hook switch - can be used to control the codec from userspace
 	 * even if line discipline fails */
diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index 544cb3da50eb..ae7fdd761a7a 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -28,7 +28,7 @@ struct snd_soc_card_drvdata_davinci {
 
 static int evm_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *soc_card = rtd->card;
 	struct snd_soc_card_drvdata_davinci *drvdata =
 		snd_soc_card_get_drvdata(soc_card);
@@ -41,7 +41,7 @@ static int evm_startup(struct snd_pcm_substream *substream)
 
 static void evm_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *soc_card = rtd->card;
 	struct snd_soc_card_drvdata_davinci *drvdata =
 		snd_soc_card_get_drvdata(soc_card);
@@ -52,9 +52,9 @@ static void evm_shutdown(struct snd_pcm_substream *substream)
 static int evm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *soc_card = rtd->card;
 	int ret = 0;
 	unsigned sysclk = ((struct snd_soc_card_drvdata_davinci *)
diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 6a969874c927..b4b158dc736e 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -251,11 +251,11 @@ static int j721e_rule_rate(struct snd_pcm_hw_params *params,
 
 static int j721e_audio_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct j721e_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int domain_id = rtd->dai_link->id;
 	struct j721e_audio_domain *domain = &priv->audio_domains[domain_id];
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	unsigned int active_rate;
 	int ret = 0;
@@ -309,12 +309,12 @@ static int j721e_audio_startup(struct snd_pcm_substream *substream)
 static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct j721e_priv *priv = snd_soc_card_get_drvdata(card);
 	unsigned int domain_id = rtd->dai_link->id;
 	struct j721e_audio_domain *domain = &priv->audio_domains[domain_id];
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	unsigned int sysclk_rate;
 	int slot_width = 32;
@@ -376,7 +376,7 @@ static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 
 static void j721e_audio_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct j721e_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int domain_id = rtd->dai_link->id;
 	struct j721e_audio_domain *domain = &priv->audio_domains[domain_id];
@@ -403,7 +403,7 @@ static int j721e_audio_init(struct snd_soc_pcm_runtime *rtd)
 	struct j721e_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int domain_id = rtd->dai_link->id;
 	struct j721e_audio_domain *domain = &priv->audio_domains[domain_id];
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	unsigned int sysclk_rate;
 	int i, ret;
diff --git a/sound/soc/ti/n810.c b/sound/soc/ti/n810.c
index ed217b34f846..6c72c2a50dec 100644
--- a/sound/soc/ti/n810.c
+++ b/sound/soc/ti/n810.c
@@ -84,7 +84,7 @@ static void n810_ext_control(struct snd_soc_dapm_context *dapm)
 static int n810_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
@@ -100,8 +100,8 @@ static void n810_shutdown(struct snd_pcm_substream *substream)
 static int n810_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int err;
 
 	/* Set the codec system clock for DAC and ADC */
diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 805ffbf89014..fb8727a74436 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -45,8 +45,8 @@ static struct platform_device *dmic_codec_dev;
 static int omap_abe_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct abe_twl6040 *priv = snd_soc_card_get_drvdata(card);
 	int clk_id, freq;
@@ -77,8 +77,8 @@ static const struct snd_soc_ops omap_abe_ops = {
 static int omap_abe_dmic_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret = 0;
 
 	ret = snd_soc_dai_set_sysclk(cpu_dai, OMAP_DMIC_SYSCLK_PAD_CLKS,
@@ -166,7 +166,7 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 static int omap_abe_twl6040_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_card *card = rtd->card;
 	struct abe_twl6040 *priv = snd_soc_card_get_drvdata(card);
 	int hs_trim;
diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index a3663ab065ac..29bff9e6337b 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -370,7 +370,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	card->dai_link->cpus		= compnent;
 	card->dai_link->num_cpus	= 1;
-	card->dai_link->codecs		= &asoc_dummy_dlc;
+	card->dai_link->codecs		= &snd_soc_dummy_dlc;
 	card->dai_link->num_codecs	= 1;
 
 	card->dai_link->name = card->name;
diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index b047add5d887..901578896ef3 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -475,7 +475,7 @@ OMAP_MCBSP_ST_CONTROLS(3);
 
 int omap_mcbsp_st_add_controls(struct snd_soc_pcm_runtime *rtd, int port_id)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 
 	if (!mcbsp->st_data) {
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index fdabed5133e8..bfe51221f541 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -720,8 +720,8 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 static void omap_mcbsp_set_threshold(struct snd_pcm_substream *substream,
 		unsigned int packet_size)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 	int words;
 
@@ -885,8 +885,8 @@ static snd_pcm_sframes_t omap_mcbsp_dai_delay(
 			struct snd_pcm_substream *substream,
 			struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 	u16 fifo_use;
 	snd_pcm_sframes_t delay;
diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
index d7d9f708f1fd..2b97f2e4f185 100644
--- a/sound/soc/ti/omap-mcpdm.c
+++ b/sound/soc/ti/omap-mcpdm.c
@@ -533,7 +533,7 @@ static const struct snd_soc_component_driver omap_mcpdm_component = {
 void omap_mcpdm_configure_dn_offsets(struct snd_soc_pcm_runtime *rtd,
 				    u8 rx1, u8 rx2)
 {
-	struct omap_mcpdm *mcpdm = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct omap_mcpdm *mcpdm = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	mcpdm->dn_rx_offset = MCPDM_DNOFST_RX1(rx1) | MCPDM_DNOFST_RX2(rx2);
 }
diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 950eec44503b..a3ad1a2df1c7 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -38,7 +38,7 @@ struct omap_twl4030 {
 static int omap_twl4030_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int fmt;
 
 	switch (params_channels(params)) {
diff --git a/sound/soc/ti/omap3pandora.c b/sound/soc/ti/omap3pandora.c
index a287e9747c2a..712e8ae5e804 100644
--- a/sound/soc/ti/omap3pandora.c
+++ b/sound/soc/ti/omap3pandora.c
@@ -31,9 +31,9 @@ static struct regulator *omap3pandora_dac_reg;
 static int omap3pandora_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	/* Set the codec system clock for DAC and ADC */
diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 2790c8915f55..5f718f9ec1e5 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -38,8 +38,8 @@ static void osk_shutdown(struct snd_pcm_substream *substream)
 static int osk_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int err;
 
 	/* Set the codec system clock for DAC and ADC */
diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index 322c398d209b..d966c008be4d 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -90,7 +90,7 @@ static void rx51_ext_control(struct snd_soc_dapm_context *dapm)
 static int rx51_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 
 	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
@@ -102,8 +102,8 @@ static int rx51_startup(struct snd_pcm_substream *substream)
 static int rx51_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/* Set the codec system clock for DAC and ADC */
 	return snd_soc_dai_set_sysclk(codec_dai, 0, 19200000,
-- 
2.25.1

