Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D46A674DBF
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:06:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 210AD2DE7;
	Fri, 20 Jan 2023 08:06:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 210AD2DE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198415;
	bh=Ei6/sxm2y7WzrDWSDRD/NVqrvqLpCMMsCv1YcDzL2Hs=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NoZRoxb8cJdu9UaqkRlc+Rd/yuJ8UN68ELpuU8kCLhXN6aUPEO8sWoojwxy8906Cx
	 vRPi5TUOEme+JXM4eTEUeurF9k92454p+m/8CCgkl9RE70LhUPXSRplPPZOax3ydNu
	 CLuDw5EBYtcU04nHCWmrIhefy4GGLh7EZheOAaug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30C5FF805C3;
	Fri, 20 Jan 2023 08:03:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCA12F805C3; Fri, 20 Jan 2023 08:03:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1ADDF805C1
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:03:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1ADDF805C1
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Qs5blwFZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/H2MZV3Q4G5logPAfaKO98VzC+/NyCJlK2tWxEPW7aiwMGH2IGBMmof/Wo6TOIMJOmhwsj5gZLad49VN2DvVY1wkGOgiYYWNKKsp4DYgJJ0tpM3mwUU8ME2m2IyTSKaN25M/qOOBf4lwz4uOZ7Ld1Z0carHcocssrYT0ia9jH41lQHOnMC6hFGKaXRj2a3AXmxRqnJbiamguM77M1+7kJ+C0wFfIG9oJIQWbbyKRT59/uaqGHj4FALLwHGvssIED/r0Jv8xquicATJjR4btkQWe4YqMZorbW1K2SWadmPs3p56F7X1hfMc/y/MHnDMX42qxgt7KgQX3gazLwBLXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abCmlxjTeJUpbD23/u/q8Igmh45AfePycqqbck2s2Hg=;
 b=GiB54lcoZ+/9071NfecM1bbL1tFVUS2MYv3p+1GpPHfSt2zko6NHZvNMNMXUmXmgxqJ0BC97wEifw+CwwiBh57ZbkZeo7jKUJzCjYEQVF3kupAdbslpnSUDTWKHa1E2PWLjXrJTEYULOh9Jvv9SZ9IEmM4t7L7dklnoQmp02aHfWRYZ/ixKXvfm/IoIjNVjbrvAHPf/oUkDa5tqk/EaDdaaVEFRdPIWqsTVqGAK5/khbPcu+isdD/JFOx4SoBlpUfJjh7UFR4NJIfRBq4YN7V9RMekNtr65fLO7fWLNj4c5eUeMFVPwLme0Myxr/JUke9msXOeNb5FBi4UFKiw/bCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abCmlxjTeJUpbD23/u/q8Igmh45AfePycqqbck2s2Hg=;
 b=Qs5blwFZ4aqV5qu79wuqXhpT4IJ8rTXT26e7nWn22/lRuU8B3MyR1QhuGGr70KBdxAKLO/FfDT5eN5UtmJerM+n4Vfhx9aFu+x7WBBr+QZkhLGtapbf6zeUyBsC5S6gnoJx36tbpeW0xZha35Qc0GJw33MJViDuhiftLcg61PLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:03:10 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:03:10 +0000
Message-ID: <87o7qtk7rm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 15/25] ASoC: meson: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:03:09 +0000
X-ClientProxiedBy: TYCP286CA0172.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: ec55c2e5-6043-45b2-4cc2-08dafab463cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUxL6HXBTS5heo3zY8mWWcse7pmPKVDsLJ93UGNDOsvZYpfCutpy3BZEuPDQ+hElmFYyVdkNv8TNBXSW5UkLfMtjkVSZJgsw1/xU809OQx4kuYNJ/GjnhxXJ4Pb4EwbihhTX/kAkyWCO3m9HNacg4BU9XHcjLDAIZdoXCS5F+JXKcg2m7cftnGqWRlulRxhUoppwUk3e4IX2xljUCMOTssH4hjeFVmWr1wzDzUtFR/VNZ8cUViAoTR6rt+yfV8oV1x45XCzGcqAwtwaRZXVCJpbRxakY+169dzjyjJksUra89TxzoANAxhhgvXHZIqw7ZzovoKrwb325G2HewII+K59nWiO8Sc+sZmrp3oPtKvgmlEugOOGAf5gxhy292m1EI0fxLqX0Uk8JYxVFOYYtsI+yA/jNpnskCztT1J40JrYLfBINcRVr0vLHx901/IoMTt9KX5+nM0Kf7Mp/bP+0fYrIvutob+zst07SF7rm3LxJSwEshnnJaboIgCraQB3bZt6UzSS7EyBWeOrSCAJRpwp+pD5C6ct198QS3RcoqOSpcjbsprrNcsXSg6aZbgfAflwi6amc6jmwl0O2t4+LMtibzAoplE3SccFvMkONvLdchcycWdHLJGQjJ7g9S7+1YWHStiIRYOm5+GySfQCYuErPgSsx/xLBewIpTPEDO3j3XdzI4Ea3chMSTfuIH11R2xIxcZCKQ283oC5YKBeK7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wrr/JzMar+ohZkUGy3G0HIeTT30UsIlARED2GR/hStVMZtSGd39SyFJIzt0S?=
 =?us-ascii?Q?2Vv7QQWuDr7os/mpOEqCiZhJJcI9WRXHof9cqkZkXgQQ5lbarj9eej7mq6os?=
 =?us-ascii?Q?6babmtzEwGTrzm9V9dzDbvNbcXWMNVhgPiLDOV/SAfVWSJ/h9uh3ATJ+nLYd?=
 =?us-ascii?Q?TAUmZ/cfsTj+FpReoF3KEZgQKbu54RJ/hJILkQWJozcn3wTbRh7nabEdruEz?=
 =?us-ascii?Q?dNFwTjnat+Uz93+5JJfBuWczWfE7PYIhU/kPriFcaJEjawXdg7MhO+aJT+Cu?=
 =?us-ascii?Q?FGHViYM1thGnpG/wZrde8pgQ6c96y/So2m2TSwpeKY54SSqsljRPwQSWDXps?=
 =?us-ascii?Q?aQTPOCyU6smdLjJKmasRdIpvAJeJGHT37MO7y4dhXaAj2hDlz4NxXlmDbqz2?=
 =?us-ascii?Q?UAuwD00sr3QU2Z5LFfVPn+zqyAubE9NNRxtpbjkzJAw7IfR0vRcvBkUym823?=
 =?us-ascii?Q?zpgQKSYhNOL+diaFtCgi86TsPPvBUq7xRQn7ILyser0LOgUxEK4ohnKgkdoQ?=
 =?us-ascii?Q?kZFvRJ/bVuFDXXcRgjgmiLt9UXjo5x6orilS2dy84ajBS4RPBvnHGe3kVABz?=
 =?us-ascii?Q?cQrc4zNeQIn7kG1M1s5X2s6tDR5NNYLIGvhJeY46sCDOJBSo2GPwdIdWWy5d?=
 =?us-ascii?Q?2gVkuIXq2SaraQtIT6yJrlRZQU07YrBO348XxiUjKPwofX/ZcRpmf+Fwr6ky?=
 =?us-ascii?Q?g9R+gsXkCmyiaQzCvBtoJ8+xCVM0V7HWskA/EnptlDPyWqsdfIMKJXdtt+NV?=
 =?us-ascii?Q?vfMpDVfYXgAeFgJAm+PJtD1A+zdiopfNXvZ7wfJKd104qLbh/l18lsQzuVDr?=
 =?us-ascii?Q?jnodwyzgC1V/KmsUnfP5Ah0EGmpF8ei1oB3xVOLkhqvPAOmVYAa+SeXWbH6j?=
 =?us-ascii?Q?AaHieEPMhQWMn0QZhyql3mOH+vFmVoyUqvVvmgVnF30uOZ9+cMTsq/PB2WMh?=
 =?us-ascii?Q?jsKJ+D3IcBF0uQIhPY3kQMBXy1dG3eNYquvqXLuEFmPkmSlMk+6qiPI9Gj6s?=
 =?us-ascii?Q?37W/F+p7TaKLfTSoZecYwPJxK6p3Hcl6fXGSJW9NY6Tutjl9HT6+32fb/W8Y?=
 =?us-ascii?Q?owIrfrZqHZEHTCwmKre50BTeUrNTzP8vgZvoGiqf1HTjK2ImQT/uDO+0rQ3A?=
 =?us-ascii?Q?3aK3jYEsJS7XPaeVt+KPZkMUmaa+0lFNNkeKktV5PD4yowrE/qEEqvwLLTlZ?=
 =?us-ascii?Q?o7iCR50ioH9WIKJzyQ+MslvUt1dK+OG9ODmywJ+BtslIS+bulOVxvk86wlTk?=
 =?us-ascii?Q?Dxwk3Bs4X+Yeu9Mdr8cp22SbxSkhF2LM6KH+gliHqPa1F8G5bAchdcAyN8MI?=
 =?us-ascii?Q?AXER/g+dSJGF3Snr02tlfi4Zl8lWLdSaFXUNFb/zZfWYL9WKtKhcRY4KtQLi?=
 =?us-ascii?Q?dpBb0iqluHzscWwpohyVpVGD0dBf4VnaAPWhizRqRPZo3LSNEKiLndzSa33l?=
 =?us-ascii?Q?0sbgOYgKgVOVRUDt+HyIGc3KcChtpmuJP9iycmI4Ostr6L2AX5VWSnZ2ofVR?=
 =?us-ascii?Q?Gcp0qX/QEXOXOl7l4B7hegcTu5sI+oWgV0GstTXLPQ/bf0wItNeZYkoZ3PGs?=
 =?us-ascii?Q?2DU+rANujjkqAgniT0yr+XvDQw5hh+kboyWgy2ksvLXqimnqaq7CQUtXYVZl?=
 =?us-ascii?Q?3BNVlHHhCyNfl8VKm2YE0wE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec55c2e5-6043-45b2-4cc2-08dafab463cb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:03:10.2765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vg88/6MRROqth7kD+tCC1jpcHAVwC1s6dZhgf4Y2yzmS7G+gu3lOTytT6DBIcH6nomqXzRzkel3U628xXbP1ReiuZQ+PVogXdin+F0lB/GQ4vG8IJIGbGbrz2B/GsZyc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/aiu-fifo-i2s.c      |  4 ++--
 sound/soc/meson/aiu-fifo-spdif.c    |  2 +-
 sound/soc/meson/aiu-fifo.c          | 21 +++++++++---------
 sound/soc/meson/axg-tdm-interface.c | 34 +++++++++++++++--------------
 sound/soc/meson/axg-tdmin.c         |  2 +-
 sound/soc/meson/axg-tdmout.c        |  2 +-
 sound/soc/meson/meson-codec-glue.c  |  8 +++----
 7 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index 57e6e7160d2f..59e00a74b5f8 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -88,7 +88,7 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	unsigned int val;
 	int ret;
 
@@ -158,7 +158,7 @@ int aiu_fifo_i2s_dai_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	fifo = dai->playback_dma_data;
+	fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	fifo->pcm = &fifo_i2s_pcm;
 	fifo->mem_offset = AIU_MEM_I2S_START;
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index 2fb30f89bf7a..ddbd2fc40185 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -173,7 +173,7 @@ int aiu_fifo_spdif_dai_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	fifo = dai->playback_dma_data;
+	fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	fifo->pcm = &fifo_spdif_pcm;
 	fifo->mem_offset = AIU_MEM_IEC958_START;
diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index d67ff4cdabd5..543d41856c12 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -34,7 +34,7 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_dai *dai = aiu_fifo_dai(substream);
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int addr;
 
@@ -46,7 +46,7 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 static void aiu_fifo_enable(struct snd_soc_dai *dai, bool enable)
 {
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	unsigned int en_mask = (AIU_MEM_CONTROL_FILL_EN |
 				AIU_MEM_CONTROL_EMPTY_EN);
 
@@ -80,7 +80,7 @@ int aiu_fifo_prepare(struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	snd_soc_component_update_bits(component,
 				      fifo->mem_offset + AIU_MEM_CONTROL,
@@ -98,7 +98,7 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *component = dai->component;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	dma_addr_t end;
 
 	/* Setup the fifo boundaries */
@@ -132,7 +132,7 @@ static irqreturn_t aiu_fifo_isr(int irq, void *dev_id)
 int aiu_fifo_startup(struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai)
 {
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	int ret;
 
 	snd_soc_set_runtime_hwparams(substream, fifo->pcm);
@@ -168,7 +168,7 @@ int aiu_fifo_startup(struct snd_pcm_substream *substream,
 void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai)
 {
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 
 	free_irq(fifo->irq, substream);
 	clk_disable_unprepare(fifo->pclk);
@@ -178,7 +178,7 @@ int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
 		     struct snd_soc_dai *dai)
 {
 	struct snd_card *card = rtd->card->snd_card;
-	struct aiu_fifo *fifo = dai->playback_dma_data;
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	size_t size = fifo->pcm->buffer_bytes_max;
 	int ret;
 
@@ -200,15 +200,16 @@ int aiu_fifo_dai_probe(struct snd_soc_dai *dai)
 	if (!fifo)
 		return -ENOMEM;
 
-	dai->playback_dma_data = fifo;
+	snd_soc_dai_dma_data_set_playback(dai, fifo);
 
 	return 0;
 }
 
 int aiu_fifo_dai_remove(struct snd_soc_dai *dai)
 {
-	kfree(dai->playback_dma_data);
+	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
+
+	kfree(fifo);
 
 	return 0;
 }
-
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index c040c83637e0..7624aafe9009 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -37,10 +37,8 @@ int axg_tdm_set_tdm_slots(struct snd_soc_dai *dai, u32 *tx_mask,
 			  unsigned int slot_width)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
-	struct axg_tdm_stream *tx = (struct axg_tdm_stream *)
-		dai->playback_dma_data;
-	struct axg_tdm_stream *rx = (struct axg_tdm_stream *)
-		dai->capture_dma_data;
+	struct axg_tdm_stream *tx = snd_soc_dai_dma_data_get_playback(dai);
+	struct axg_tdm_stream *rx = snd_soc_dai_dma_data_get_capture(dai);
 	unsigned int tx_slots, rx_slots;
 	unsigned int fmt = 0;
 
@@ -362,11 +360,14 @@ static int axg_tdm_iface_prepare(struct snd_pcm_substream *substream,
 
 static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
 {
-	if (dai->capture_dma_data)
-		axg_tdm_stream_free(dai->capture_dma_data);
+	int stream;
 
-	if (dai->playback_dma_data)
-		axg_tdm_stream_free(dai->playback_dma_data);
+	for_each_pcm_streams(stream) {
+		struct axg_tdm_stream *ts = snd_soc_dai_dma_data_get(dai, stream);
+
+		if (ts)
+			axg_tdm_stream_free(ts);
+	}
 
 	return 0;
 }
@@ -374,19 +375,20 @@ static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
 static int axg_tdm_iface_probe_dai(struct snd_soc_dai *dai)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	if (dai->capture_widget) {
-		dai->capture_dma_data = axg_tdm_stream_alloc(iface);
-		if (!dai->capture_dma_data)
-			return -ENOMEM;
-	}
+	for_each_pcm_streams(stream) {
+		struct axg_tdm_stream *ts;
+
+		if (!snd_soc_dai_get_widget(dai, stream))
+			continue;
 
-	if (dai->playback_widget) {
-		dai->playback_dma_data = axg_tdm_stream_alloc(iface);
-		if (!dai->playback_dma_data) {
+		ts = axg_tdm_stream_alloc(iface);
+		if (!ts) {
 			axg_tdm_iface_remove_dai(dai);
 			return -ENOMEM;
 		}
+		snd_soc_dai_dma_data_set(dai, stream, ts);
 	}
 
 	return 0;
diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index 49b613a1faf2..c8f6ea24ae78 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -83,7 +83,7 @@ axg_tdmin_get_tdm_stream(struct snd_soc_dapm_widget *w)
 	if (!be)
 		return NULL;
 
-	return be->capture_dma_data;
+	return snd_soc_dai_dma_data_get_capture(be);
 }
 
 static void axg_tdmin_enable(struct regmap *map)
diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 22d519fc07b2..c4039e4f0847 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -81,7 +81,7 @@ axg_tdmout_get_tdm_stream(struct snd_soc_dapm_widget *w)
 	if (!be)
 		return NULL;
 
-	return be->playback_dma_data;
+	return snd_soc_dai_dma_data_get_playback(be);
 }
 
 static void axg_tdmout_enable(struct regmap *map)
diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 80c5ed196961..5913486c43ab 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -39,13 +39,13 @@ meson_codec_glue_get_input(struct snd_soc_dapm_widget *w)
 static void meson_codec_glue_input_set_data(struct snd_soc_dai *dai,
 					    struct meson_codec_glue_input *data)
 {
-	dai->playback_dma_data = data;
+	snd_soc_dai_dma_data_set_playback(dai, data);
 }
 
 struct meson_codec_glue_input *
 meson_codec_glue_input_get_data(struct snd_soc_dai *dai)
 {
-	return dai->playback_dma_data;
+	return snd_soc_dai_dma_data_get_playback(dai);
 }
 EXPORT_SYMBOL_GPL(meson_codec_glue_input_get_data);
 
@@ -99,8 +99,8 @@ int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct meson_codec_glue_input *in_data =
-		meson_codec_glue_output_get_input_data(dai->capture_widget);
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget_capture(dai);
+	struct meson_codec_glue_input *in_data = meson_codec_glue_output_get_input_data(w);
 
 	if (!in_data)
 		return -ENODEV;
-- 
2.25.1

