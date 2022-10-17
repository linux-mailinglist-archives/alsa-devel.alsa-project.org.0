Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85816601DC8
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32EFF8E3C;
	Tue, 18 Oct 2022 01:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32EFF8E3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666050008;
	bh=DXjoQ6fWdOF140b03+p6tZNuGNBBK1fcepGfgEQSjq4=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SavDTltD0TcQ1ZA2+rt11TXggAYQ6stjZGZkYVCimtOlc5pOIFWKLRlsXS19u7hrh
	 mzi6xgpxivmxaYlYAs1AfP+PGl3Kl19ve96V7nKXdZBdP9iD6m1giUO/IghadykJY4
	 gn6TXpUYCddZNIR4HoLJqWAtdFYFxug3E4T86Ye4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA3EF805AA;
	Tue, 18 Oct 2022 01:37:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7627F805AA; Tue, 18 Oct 2022 01:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24859F80558
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24859F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="L/k2tEvl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acYfLaxduk/DA+pC1tEH6JZgMv3bmVqj/7uiwSmmSnJzLOxvH+YnvmbRGuBdli5LE2PQXM7dKfCnQVbltXM0GOUzmCauLAmTBMhtttQ9OiIhRTH3lasZSujDoMDfodb90pWvt0H074o6abG8U+lRp9wnlb9EckMEBGc86FwgCpa0GZnNb7LIp5vT/UmtLkDipGhEcCb00LSE9Pfkmxg4tbQZXvF6avoJ+eCFCojCa4XzU/AmBeT10dDrpRPvrxtkM0ZtttLryLDQvxyvmFVqk/fNb5uvg2XKTStZnmgTY+Gsc7Tjz003JL3hrA3MNkciIJqGox1V8nXsdjtTK+EK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcJwnwKypDyuSGc3/d08Q7cuBDi9r8no8ZMLU529TCo=;
 b=m308bdeEferKpyKNtBKBKV+owaA8L2JxStsaE0X69PgCcBp5WSSmeXYhRLjkelPqqfy9hTzQbNjElE8pDurp4zWPwXMcYyunBSiBomuwMkoAUF2EpIXs4wYYEpEZiTEDwuQPutriVrvukBSHfFyasOAhP0YcKKJig7v4ox8oGE8rmUR7h4i16rZEWWOLwno7y8Z2Yr3mNs2J6NFxEzIFrZNxm+0naGuTCfEXjH6Ci8IKvkhCjmkXQ6tRyrdtD6h79WvNp10uoTDIM40EwrRKZM1lXuyc+orzE7kNXMZNRNQmFd9ZqnqTn1uigcvqLRWCXXDnJAc0gp2FIDe+e+oZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcJwnwKypDyuSGc3/d08Q7cuBDi9r8no8ZMLU529TCo=;
 b=L/k2tEvlg4ZbDgxbTMW+QuIBf0782N8Ccg2JQQOHy1X2GxsrGyMdnw4paoj+LYwXBbRlKtexU/1/vg9xU+iZ2ZLijm6DmLwRXGEXrPa6eVdQl2jDVD68hu5Hcz76kgZG2DxuAAexlGBtPtJeQjtM6z1Ieehy3IoYHIPsul41G4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8180.jpnprd01.prod.outlook.com (2603:1096:604:176::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 23:37:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:37:32 +0000
Message-ID: <87mt9uowcj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/11] ASoC: soc-dpcm.h: remove snd_soc_dpcm::hw_param
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:37:32 +0000
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1ee9eb-ee64-4a52-2e74-08dab0989003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AS39LE59YTzU+VLIX87zjDf1l9Jwk62POjWmQKwI1Tqs479RFb8Xy+QDK78maP1OuTaunEKZZmNjvZICR1S0F1VegacwKWWHFwhtgFIOsOQDFbkmK7spPeSqB5O3N29gYwht7i8PTPuJNQgZa1BTrGosIkITZyaGCkh9T3v0eCVdsQTRiKco1U868c2iS3G5leJ9wR6OHCQGCO05HaiUimN6gRvPYli3cyoho/Zrv3932rnCUcXg8ib1DO81cUhNu3ua85/l42MQ7fdyDHJbIQrdvrlfdyAIh9L6Lx7KBaxVFPI34JgY1EgB8Kq/s+7wL9IvED7X8FfvX8KvsjFMD8ujPHNgPQoQw1nHT7fxH/4/0GNnhDi9iJvd/UzsGPE8AzFzKpRewrITxK2F8pHVYP+mTDavXepIKbLO+CK729v+FOqMX342j1ImbKKD/xXjZJk0ziV4YWqr53uTMFVrrxRWN+0fi0x+wxBlaqMwNxx8YLVSfEVaXvfWlNIoFGbP7HbRzIyio9ORMK3NP0eF6QLb/S7JMykH2f97/fSW7e/oDszbwQPPbpFmd9uFU5Td5e9iSFT96BDYwn/wSM5grPIGEMAL6JaLXMt4DaLl+TaoKzrN4s6pfW51Wa2EioyPfOuWcaLqcWCNpl8xwxQACZhqMG7ZgGUDYJQ8qR50vCiWIXFK4asgG0hvUz2GAV0NTz7s73JWotJ+6MJg0dWoY5wnCt5g3dZMGBQRNl3ATzZqpLvltE2YUzd+itGTVpki
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(86362001)(5660300002)(38100700002)(2906002)(38350700002)(2616005)(186003)(83380400001)(316002)(6506007)(6512007)(478600001)(6486002)(26005)(6916009)(66946007)(66556008)(66476007)(41300700001)(4326008)(52116002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vApVoZ4qCrANkeHdzY2klNqqTfcPcSOp8P5VBZLGLFU7XgML6+fmr8S1gtvC?=
 =?us-ascii?Q?b8XycYd1OCxRll7bC4AoQCfM7MXaqQWSE+Wyh65FkaH7JOU2Ho3rbBRnSaY0?=
 =?us-ascii?Q?XSFwrVXAphWwYst71LrfEsKweo3u1MjMVffS89MROLK8aqsneXMEjHQaib8z?=
 =?us-ascii?Q?v2/6osoRz9fmDVaT0jR8KLpixOn6XtgdiSYmbCcdhVk16+sQyWNFlJZkUW5L?=
 =?us-ascii?Q?Rym8f7uYk6Nyv4X6wjy8NCQTB1DXIJEDbR0TS07XCk7yF4MSdee2yXPvaTmo?=
 =?us-ascii?Q?KPSK1kS+YTef83Cd/GXRyV/NHuzbOj/zitRqnytgllB3tKhD3pemp/8HZ/LJ?=
 =?us-ascii?Q?dC9NW8LBEjv1Ai/u6xL0LL0MYgFrhz/U6yQfX12G5QMzNTk5TFdJeorbvsL/?=
 =?us-ascii?Q?xNQ1TTOwZsXDwJ/762+kVs8xitMDUzAyYZ5NH4gVqDTBl+mkVIzhBB39Sip7?=
 =?us-ascii?Q?7LZFHfY13oFb58RcQ63SjuupYX0tP1NaNxU319GOT5HGbybUViFijlfJQIe+?=
 =?us-ascii?Q?EmZj3DgGjHrkG+a6v1qrlAw3UkvirLeUPH0E+8XlPMOxxGEpkLe1fDOm8pxS?=
 =?us-ascii?Q?/h2KT2iG+dKRoXpy5KMNQWBEbpuQme+25eaM68tnsFF2mOn5AWfl4ajktnK6?=
 =?us-ascii?Q?kKjQ22e9aQLjgxX09gTEL90IkvsYn1LY1b6yVHyyHaXu31CBHm8tS/Z3yEDr?=
 =?us-ascii?Q?Htvm7w/BAeEhSDfSt7aX04i71QYP4Wm3UWlpQTdiKtvD3GTEzU8bXyV2XuR0?=
 =?us-ascii?Q?bywzXd2kq8lkXfsPn35BPHtg88hDwbprNLYSPhiUpCpgWXzDZPTGpVerv7m3?=
 =?us-ascii?Q?iq05j2s3Eo4UpssPS9OBp77CCcfE6C2bPm3g64EM1RtbFkIeTbvSmqYfcCIv?=
 =?us-ascii?Q?VFMgeiqiQMPWAG4rJBXck0rHlzt/vJy1PwNyNx150OUzF7xZ0/MB96TMY1a3?=
 =?us-ascii?Q?rcZVCax6HPjqA6DbIBubxaq8cLZ3wEcZLajkY2aeQesL+k7/K8co+wFVQAd/?=
 =?us-ascii?Q?HJvts8SluZDSVcS51c9rEiZY+IkrENVBtq531+uIVqWeG7/IIMUZVRjdmNb6?=
 =?us-ascii?Q?9O6m0v+BjK2TTwGuPHPM9v89MXjOnJ8R5WO6l24NtsL44rVHMd2oXjs7Oqy1?=
 =?us-ascii?Q?orELaurPO4YHqQ9XHH5a1L7rjicjYeQ7jCsfqNe3MMw7Bt7ec/flgsFZTwuG?=
 =?us-ascii?Q?KNGuFTj1S6NeovyE0nOlq94LDFlkso57cLINlxabJvbBmUikYJ/aBQK1Y3so?=
 =?us-ascii?Q?bfW9gXZcQvalb3BYs7Rw54a1O3vlcpRBBALbV+P8dxANV2HaNPOXxwPjxiLo?=
 =?us-ascii?Q?QE9+S9ppC5UoC8gi3ulNmtgSJiYCitJzBmByiBD5bB08X+yUao76HqZRp3kl?=
 =?us-ascii?Q?RbshRIuhbQ8EWhJWQKxXknUaFgEYJtUT52Ym68ZvDo9FMY6oNhdhF3SSA/A6?=
 =?us-ascii?Q?dAR12pGT6lhxfCBrO5P8eDxF9BoQ0Gzy0zLCB36r9QK8u3BYZ0Tcen6MNsI/?=
 =?us-ascii?Q?er/GxsXadXX58/e/VWo0/erqSb/AcXfL2NDjvtmJeEZ+Ajxnn3HgvZJ14URe?=
 =?us-ascii?Q?CtjKpiBXOhAAg/A/033snyp9BUUXhqO+mFkMeE2frK6dwmA1rUho1VhMVZ1s?=
 =?us-ascii?Q?qozbHprjbdpCNwzE9fyYYcE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1ee9eb-ee64-4a52-2e74-08dab0989003
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:37:32.4929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Unjy44WBfrX5TZ4KH18MvRwsXthm9/O6M9XNkAil3v08/QjOkmb+6khHIieoT4M05i4g5XX+L+eKp3OMuwop1/Lochnaq/CPyd74QzlPPw0qqXRvu9sgIz0gdPwNFtT6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8180
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

Current soc-pcm.c is coping fe hw_param to dpcm->hw_param (A),
fixup it (B), and copy it to be (C).

	int dpcm_be_dai_hw_params(...)
	{
		...
		for_each_dpcm_be(fe, stream, dpcm) {
			...
			/* copy params for each dpcm */
(A)			memcpy(&dpcm->hw_params, &fe->dpcm[stream].hw_params, ...) ;

			/* perform any hw_params fixups */
(B)			ret = snd_soc_link_be_hw_params_fixup(be, &dpcm->hw_params);
			...

			/* copy the fixed-up hw params for BE dai */
(C)			memcpy(&be->dpcm[stream].hw_params, &dpcm->hw_params, ...);
			...
		}
		...
	}

But here, (1) it is coping hw_params without caring stream (Playback/Capture),
(2) we can get same value from be. We don't need to have dpcm->hw_params.
This patch removes it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dpcm.h |  2 --
 sound/soc/sh/rcar/core.c |  3 ++-
 sound/soc/soc-pcm.c      | 12 +++++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 5b689c663290..2864aed72998 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -78,8 +78,6 @@ struct snd_soc_dpcm {
 	struct list_head list_be;
 	struct list_head list_fe;
 
-	/* hw params for this link - may be different for each link */
-	struct snd_pcm_hw_params hw_params;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_state;
 #endif
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 7e380d71b0f8..6cebaef77f84 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1518,7 +1518,8 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 		int stream = substream->stream;
 
 		for_each_dpcm_be(fe, stream, dpcm) {
-			struct snd_pcm_hw_params *be_params = &dpcm->hw_params;
+			struct snd_soc_pcm_runtime *be = dpcm->be;
+			struct snd_pcm_hw_params *be_params = &be->dpcm[stream].hw_params;
 
 			if (params_channels(hw_params) != params_channels(be_params))
 				io->converted_chan = params_channels(be_params);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2ce9a8188378..57d748ee291e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -155,7 +155,7 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		params = &dpcm->hw_params;
+		params = &be->dpcm[stream].hw_params;
 
 		offset += scnprintf(buf + offset, size - offset,
 				   "- %s\n", be->dai_link->name);
@@ -1980,6 +1980,8 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 	int ret;
 
 	for_each_dpcm_be(fe, stream, dpcm) {
+		struct snd_pcm_hw_params hw_params;
+
 		be = dpcm->be;
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
 
@@ -1988,16 +1990,16 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 			continue;
 
 		/* copy params for each dpcm */
-		memcpy(&dpcm->hw_params, &fe->dpcm[stream].hw_params,
+		memcpy(&hw_params, &fe->dpcm[stream].hw_params,
 				sizeof(struct snd_pcm_hw_params));
 
 		/* perform any hw_params fixups */
-		ret = snd_soc_link_be_hw_params_fixup(be, &dpcm->hw_params);
+		ret = snd_soc_link_be_hw_params_fixup(be, &hw_params);
 		if (ret < 0)
 			goto unwind;
 
 		/* copy the fixed-up hw params for BE dai */
-		memcpy(&be->dpcm[stream].hw_params, &dpcm->hw_params,
+		memcpy(&be->dpcm[stream].hw_params, &hw_params,
 		       sizeof(struct snd_pcm_hw_params));
 
 		/* only allow hw_params() if no connected FEs are running */
@@ -2012,7 +2014,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 		dev_dbg(be->dev, "ASoC: hw_params BE %s\n",
 			be->dai_link->name);
 
-		ret = __soc_pcm_hw_params(be, be_substream, &dpcm->hw_params);
+		ret = __soc_pcm_hw_params(be, be_substream, &hw_params);
 		if (ret < 0)
 			goto unwind;
 
-- 
2.25.1

