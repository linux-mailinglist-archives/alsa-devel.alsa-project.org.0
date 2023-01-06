Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE8565FD73
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:18:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CD6414118;
	Fri,  6 Jan 2023 10:17:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CD6414118
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996729;
	bh=aFw+YKT94yCYAfiQ0D8+Tr1Z3D0P8PQy1C+3t4w1JFU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JhEafh7w7MKjIpy1BfEiBcKfKVV13TcmC/+2kApYWWKBSHCdn9BZSOTGiiotHaIBi
	 J3AEyleumpYtK6jYxQob+nVqPrNmbinvM83nkXBH45/YL52lqjoqcozptiGNES1H8p
	 Px1yJU8idaaQUdytz3KuOowC+K5KdYvgD6oJRvlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45B61F805A0;
	Fri,  6 Jan 2023 10:16:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7D0AF8057C; Fri,  6 Jan 2023 10:16:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2040.outbound.protection.outlook.com [40.107.129.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF3AF8056F
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF3AF8056F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBQapV043C2mJs4k5ayE0ENmweF+OL3sCnACaNtrOk4QmvrwRiPx/gK7/65qjiDkL/yWt10SBSkc1U4z4qTQU73AGLJ23EoFuTwKMZOY3BhmYr7JKxYYb5ktE9cle3zWytLnVgmL/rzCuxEPNMmvHI8306K32heN3hbTBG3crT65s0rWuBOW56UoL2Gqkk+xqu7n+ZA/7mPUw6MmQiitgOM2Cj0bKQ/MP7aNcmlIt656utATloIQU6T4biz5gtNJq9JSLdSMoqXhqi3h4MWJsl+80SqFlYXCr54LXjPlxw/UAcaNp2tkWeoRl/DPuge/BTEobBYIWSdz5TEBmU7Q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtU6VxcEUvysZz3K2uE5WibOhxzRXuV+DiAEyEB5mxE=;
 b=UD9AeTOBPf8JFXd3HgbeGOVvFO9wILhp5ZMCWFqG4QsDebT732Occe3TYZBHcCoWayAZwjD8EIvOR1/kHKOkyOf/TfIt1juO27lV3JCQp1huYHM8qivBsHxfFTlvXut6MQ6j/DSpHDmY9xNVioPHDru5L+fOBvSWE4EFR3bnQvKohWHQcS8Q5iQBZANDGbEJv7bwnLG4bHr4dOZjtq9zMrDy78VktlEJ4xFeHuErwad/hhhXC99+xd/gJgom4VGrpYyBA1dwmZpBN2qzTOiI8sOJy7hHttAkf39czMD/+h1PVuOmQfT/urJX4u1zPyGhbugl9v3Uo5DHldHeLVvN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:15:59 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:15:59 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 08/14] Remove the mute control
Date: Fri,  6 Jan 2023 18:15:37 +0900
Message-Id: <20230106091543.2440-9-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230106091543.2440-1-kiseok.jo@irondevice.com>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB1300:EE_
X-MS-Office365-Filtering-Correlation-Id: c9da9cbc-8392-4b2f-53cf-08daefc69fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHjHgYB39SFpscJzsK48zLwJw300+kDRiY3gF0UxZE6lJd6p0Sgeun6KoibMEoibTsi0StzWc7PZQDhtC3Tx5/sKgB8niGwXkCdXovvyI5pw5G2+SV/WAnfa8dqZnp4ajd8+D0HC9NPng1L76tpSC0IYaQZBx8nDC7Lk+g4TH9kNdo9K0Vx+KDBhlwJOzJSSPZPgk4o5EBWsuQQ657hkr8Wc7by5OMEjWjK5HOjovtJ29ZExu8xbjbxXpUekYTPfA0I9CDeCFF7wniyhYu/T0ptJgmYqScsG7GuAy7NDn4AbLT6eTx1d0nJI6KFEPPbT2yo493YqSn9N0n6sSEPFQBpWEjy9mL8ybOIYTNxWnifjJ3H2woro7zjFGExiUw2f0LHwLLVKXXhkYEVh2MP8yD/q/3/lcT50rm+a/kkaXte9tqKMSATkpOxRr0uiXHZ29sOcDOr/jhmwZPxOJuRIm9lJ+D6wwmtT7Y1ldpPtKq2ZJoQcFYfUnplzkozZw8p+Q6zlN2udMCB+I35wRxk51irHKSP/Nqr+d6KubWLdLxA/IXmbdE4vOz7tLu9P7I0TZMFvdVCAlH9Xxe8iG5LVlkvc4iseRUBcqMwae6ZsjarAbSUPAZhGKXpr76BY+NujXacGc0Tw1np9gESCAANkS5R8ZuKZzmEtfysq1geQWQM9gBOQkeflKtKEEIpqn3P8xD3+qmEgKnz3sLe1ddQnvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(107886003)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bI2+UFf+a/P74PY+429AnPTzsgh31RMp6AZ4Oi5KrM9V+jyVK3V/QAMixY0p?=
 =?us-ascii?Q?7AYU1RxKNFzNqE5/gkVEO3mqlF10LoL66nEw+owA4dpcyHVQAyPDIrHvUMEf?=
 =?us-ascii?Q?nohGghgdGWD0eO5fv642dGR/ZRcKVcn87Uv4H7rGKuqJw4E7nfT9wHJHcHR+?=
 =?us-ascii?Q?oRAHZV4qis5dzCJ9BznyROvljM0KF1I+KcyAv7YBMoIEM2d3TejR6eYFUVeI?=
 =?us-ascii?Q?Q8g4e8xMLPJTbQSdkdu8g9LfxLv0E47yu4SuHmo22dc50g4bVQRfs7/izbAD?=
 =?us-ascii?Q?Bsrwyc9aVmcvhsdy551Mlf6vvi1IHU1fIGKM5nDVNw2y6xTFe6jezlycj5o5?=
 =?us-ascii?Q?Pjoedl3dwXaw3vm+bsYJMON5vkYtI/EksGPa6z3IV53V9daqJIMtMvP28c8p?=
 =?us-ascii?Q?d5c8/Bfq6I5/rKCSngbwPqstswxo+esJMiaEQhaueQgDldLdWUBzj/Y53j84?=
 =?us-ascii?Q?Yk9Hd45Nr/z02njnxh3Wfv7v6gfQed8gwhESCT0rjmYZHQE0lKaFhvQuYEp1?=
 =?us-ascii?Q?S5a2lAKwq6DG6C8zGpMcIgNGRPLYhcs9VPrwGjQdjICn7Jhv89uzgkW0xPoE?=
 =?us-ascii?Q?w6jbfGBBC9uZAmzGTLjIlBqSXxzRxWU4o3ma2TmhPaX9wvY0x8qQ5rOr1UTA?=
 =?us-ascii?Q?plY7iA60T7GNd8hlCaKGD1dJ6P3avB2RwpytNbehVmm83/Ed02Xzssvv7M5A?=
 =?us-ascii?Q?YbH8M9WM0H5itAdEpBKzpNusfeoU545651U6gXwYE9m5FkV362Od9pCelqjS?=
 =?us-ascii?Q?1HtYW3fqHE/2yAGzjXMjosiqnAJL9A3M9eNNzdVnHfWcloeHf8WkwKtbR7+f?=
 =?us-ascii?Q?6TyslaDKYJ0vMgqzxzeJ1o8BkiEEOMZpbGL5/vgm3yKocGVvVwTF/AwcRQEU?=
 =?us-ascii?Q?F/sEVuwfQrHAdyGPRVzAAgW0+rfWZ2YMjHv1+fLcFHdPVKz/CZxa4aHeQJ9d?=
 =?us-ascii?Q?qBPsToU13j/Rk5uH2EHt9Qf+w61A5dXEzy78uhIb1CWA5g1EpCD8mo7ASIZ4?=
 =?us-ascii?Q?4R5iRChmDRIlBV9S9MenwM6njpoty9+orLINj5U5tOsPx5MEbytukvsJnxa1?=
 =?us-ascii?Q?Ey1ZFbT0/KJLS4Pu1r+0BbiErkOjNJCbamYJAhB09cqSAVNJkpTtCZIgZmR1?=
 =?us-ascii?Q?OlrwN8xNGtSYxepljyefE3neKcHJ7KgCxqtuki2+02TXGlWeOrPMBzNZ15EK?=
 =?us-ascii?Q?jtolSbmRqiVX8///BuMl4270heh3L630rhUJLIAXuUeXS73wfvyd91JbFkqu?=
 =?us-ascii?Q?MLT9EHjWM303V8UZ818QMdx8YFMZUUotR5t3BsozltejmbJp+ceOg0eudf8p?=
 =?us-ascii?Q?PKnmLbZoc0UkJ37VNof3htrPkr6rl6WgjvfGTAmbe4ZxNNHWxlk+D1IFbEq9?=
 =?us-ascii?Q?EbsmRbfDU7cSIg1lOukFtKz2yDvgpo+r5x8k9tm5xDFJw/AZXRQZT+Qs8BSs?=
 =?us-ascii?Q?u+jDQyDUhLDBnB8HvO5UZr3PLbF4daTTqHC2Rc9cuUIXsA3zZ3u7DZ9fuhSz?=
 =?us-ascii?Q?uFgNzNRYq8Gx6JiULXnXfyo+YkjFEWa1Gmxd7n9drGEZGF2+Zrt6scv97AAV?=
 =?us-ascii?Q?Q46yBCD3KWiqNxiStb9P2YA5w9NKDUC1Z8h2GBHu?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9da9cbc-8392-4b2f-53cf-08daefc69fd8
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:15:59.4726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raYFJqCHUyGGNSqjuYbbWggzwq32GSOi5agClMiRU1f7SxXo1SsYy2XYqa+MfQIYj2Op8Q2B9XWHtrOEcxNi13qGJujHd2gR9W0bWbcWW2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1300
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Remove the mute control and add the force mute control instead.
Already used the dai mute_stream.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 sound/soc/codecs/sma1303.c | 72 +++++++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 1199302af01d..3a60927e20aa 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -68,6 +68,7 @@ struct sma1303_priv {
 	struct regmap *regmap;
 	struct sma1303_pll_match *pll_matches;
 	bool amp_power_status;
+	bool force_mute_status;
 	int num_of_pll_matches;
 	int retry_cnt;
 	unsigned int amp_mode;
@@ -351,14 +352,6 @@ static int bytes_ext_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static const char * const sma1303_spkmute_text[] = {
-	"Unmute", "Mute"};
-
-static const struct soc_enum sma1303_spkmute_enum =
-	SOC_ENUM_SINGLE(SMA1303_0E_MUTE_VOL_CTRL, 0,
-			ARRAY_SIZE(sma1303_spkmute_text),
-			sma1303_spkmute_text);
-
 static int postscaler_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
@@ -445,6 +438,34 @@ static const struct soc_enum sma1303_aif_out_source_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_aif_out_source_text),
 			sma1303_aif_out_source_text);
 
+static int sma1303_force_mute_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = (int)sma1303->force_mute_status;
+	dev_info(sma1303->dev, "%s : Force Mute %s\n", __func__,
+			sma1303->force_mute_status ? "ON" : "OFF");
+
+	return 0;
+}
+
+static int sma1303_force_mute_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+
+	sma1303->force_mute_status = (bool)ucontrol->value.integer.value[0];
+	dev_info(sma1303->dev, "%s : Force Mute %s\n", __func__,
+			sma1303->force_mute_status ? "ON" : "OFF");
+
+	return 0;
+}
+
 static int sma1303_startup(struct snd_soc_component *component)
 {
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
@@ -484,9 +505,6 @@ static int sma1303_startup(struct snd_soc_component *component)
 					CHECK_PERIOD_TIME * HZ);
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303, SMA1303_0E_MUTE_VOL_CTRL,
-			SMA1303_SPK_MUTE_MASK, SMA1303_SPK_UNMUTE);
-
 	sma1303->amp_power_status = true;
 
 	return ret;
@@ -503,9 +521,6 @@ static int sma1303_shutdown(struct snd_soc_component *component)
 		return ret;
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303, SMA1303_0E_MUTE_VOL_CTRL,
-			SMA1303_SPK_MUTE_MASK, SMA1303_SPK_MUTE);
-
 	cancel_delayed_work_sync(&sma1303->check_fault_work);
 
 	msleep(55);
@@ -743,13 +758,14 @@ static const struct snd_kcontrol_new sma1303_enable_control =
 	SOC_DAPM_SINGLE_VIRT("Switch", 1);
 
 static const struct snd_kcontrol_new sma1303_snd_controls[] = {
-SOC_SINGLE_TLV("Speaker Volume", SMA1303_0A_SPK_VOL,
+	SOC_SINGLE_TLV("Speaker Volume", SMA1303_0A_SPK_VOL,
 		0, 167, 1, sma1303_spk_tlv),
-SOC_ENUM("Speaker Mute Switch", sma1303_spkmute_enum),
-SND_SOC_BYTES_EXT("Postscaler Set", 1,
+	SND_SOC_BYTES_EXT("Postscaler Set", 1,
 		postscaler_get, postscaler_put),
-SOC_ENUM_EXT("Postscaler Config", sma1303_postscaler_config_enum,
-	sma1303_postscaler_config_get, sma1303_postscaler_config_put),
+	SOC_ENUM_EXT("Postscaler Config", sma1303_postscaler_config_enum,
+		sma1303_postscaler_config_get, sma1303_postscaler_config_put),
+	SOC_SINGLE_BOOL_EXT("Force Mute", 0,
+		sma1303_force_mute_get, sma1303_force_mute_put),
 };
 
 static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
@@ -1084,12 +1100,17 @@ static int sma1303_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 				SMA1303_SPK_MUTE_MASK,
 				SMA1303_SPK_MUTE);
 	} else {
-		dev_info(component->dev, "%s : %s\n", __func__, "UNMUTE");
-
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_0E_MUTE_VOL_CTRL,
-				SMA1303_SPK_MUTE_MASK,
-				SMA1303_SPK_UNMUTE);
+		if (!sma1303->force_mute_status) {
+			dev_info(component->dev, "%s : %s\n",
+					__func__, "UNMUTE");
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_0E_MUTE_VOL_CTRL,
+					SMA1303_SPK_MUTE_MASK,
+					SMA1303_SPK_UNMUTE);
+		} else {
+			dev_info(sma1303->dev,
+					"%s : FORCE MUTE!!!\n", __func__);
+		}
 	}
 
 	return ret;
@@ -1728,6 +1749,7 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 
 	sma1303->amp_mode = SMA1303_MONO;
 	sma1303->amp_power_status = false;
+	sma1303->force_mute_status = false;
 	sma1303->check_fault_status = true;
 	sma1303->pll_matches = sma1303_pll_matches;
 	sma1303->num_of_pll_matches =
-- 
2.30.2

