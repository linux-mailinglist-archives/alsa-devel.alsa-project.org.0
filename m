Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EEB69027B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 09:50:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BC7B843;
	Thu,  9 Feb 2023 09:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BC7B843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675932655;
	bh=kJkpXWTtVEbnLLV/yNcNQwe6k9QIZ18CsRxznQODOMQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IKskCV/Zmxg/7Z8QlSSbhOdDEWJqU5qkfWv8UgL6Mz++XvwOrGV301LHy3ATBdOLv
	 e+OHsN7JzUMiTQQJPXGsfr7HXgFnDxSVKXGh8PJfZT0CdY1nKNBZMPaMwD3dSW4C4I
	 gNM5wQq9PL6iL0MfPfyg5rKmDg3Rzks35pof3mqE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE106F800B8;
	Thu,  9 Feb 2023 09:50:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A468F800E4; Thu,  9 Feb 2023 09:50:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 141D0F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 09:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 141D0F80086
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ND+EUUeRk41pjn6ZvFWiE3O7ZpJGr41LUAcU6Pbb3ojYnl1Aopb37KVuK9LFFJjxT9DQi7ZIRcuiT22Hp/BsCfVtigBx+ZTpQB+9ma2XmHMPfr7gnOQXn1Zv/Ye6cOHe2fip6oz/W2AMv+Xt6ElLB88RmQDZ4GDnctKL8LJ1GYXdxc+kC0hQqABbvyb/Jg3LhDRfFvy/8jJtYtkK+zd3Fu5Whw4JM9T+3e5CxoIU8oTLeCpZ6Erkgp9U0T0d98HbX31e9Wa6YkEUXbSTL6R093GWcPLy9H/9pjCTcucn7qjZgCiikZ7ldWlPz8mPHuknmi3Ni1T0Cn5ILAXW/W497w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWLPzO/EgyNuz7R/cnifW3FiP1fbF2ktbkLLn0GKeAc=;
 b=Sh6UX8YLXb6Zj2LrI/q8+mq4p/HLfpOM6equS6B022AbeGSeOlqX8kASZgAER3nADjCsTw+EaiVVULoAMdRv5855fmFB2onRovoSi4CEyRHpGjVCPAqVaLwzLPTktFAi1LKvQNi/Y6sAhglEAEiSs7DQ+oIE4YMWBg95DqXTYRhpJ2d171uQX5ZCIGwGSffeTzdvflMZuq8Rx6dNV90Qxz8HjZrcS5oZQMWHmXEwBaxeL55byGhiCJUM9uloejU7VcZeSdL/xd9T+95LSUmDngJNDugrlt9hWn7XwvowEAfiefmsTPZTtIM9xRzyCpB/XC4bqcjCjrZd2acozOvgMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB0827.KORP216.PROD.OUTLOOK.COM (2603:1096:100:26::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.18; Thu, 9 Feb 2023 08:49:41 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::2007:efb4:28b0:758a]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::2007:efb4:28b0:758a%9]) with mapi id 15.20.6086.018; Thu, 9 Feb 2023
 08:49:41 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in devicetree
Date: Thu,  9 Feb 2023 08:49:03 +0000
Message-Id: <20230209084903.13000-2-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:100:2d::15) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SL2P216MB0827:EE_
X-MS-Office365-Filtering-Correlation-Id: 16bd94f7-8783-4cff-67eb-08db0a7a9587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Eo2gkBGlCLtGzEpmxJ5MWnRrIdPVPwXJsiLam5Cvfcr+HEjrt2KalEFKchn6zVFeBb8WsuKYTFbrWrInWITFb2iiArQYUXsXBIDzB+rADGhx/tGwe2p3I+0ywM9lBMYE/jPwF/+7pI4HkpsgERK1bxBEwI8FBrUqhXnaS8ECF3OSM3jA4cIOO80LNkXPhA9UtQvreol/GPIkfdGmsw5eEzU48gKOo+YOLc+xYGSQE84xP7E+roJehmFf6VivB5ASzl6i+0WRe23Zx0RaGd1Kzzub0EyYSCGJUjSgAq8roupawzKZiDACNN6d7A1GIHmQQyajjDaWY9CQAIXYKpnwFL87OCQyaAZzZUBN3RdLeCymOhSWkmk5kp/zUMKdZagfC8r2E5kmaytrkvzhkItZjavlB8JJ1q3HIGgxOq/d7GbQq2ptfHzG8gREe/UIVtwY/FFVVaYD8qa4aFawlmKImPxD9KKTNJGNiALEbiwUdLMgRgJiWHn7Zp1B0ayWtZe/7pv2OJpRzoh6bpzlWtDFkkO0/zcRp24fk2ODHBekTiuh4BrVCS66wWDs8aoiEyjJCWhOlttt+Jp8pp6jofV29Tv7zMX4u6Kij3skF1hhxF+9hI7gjN5dbZXefKBXni/umcvyzbPIq9nhnpvCYChwE6+s1TekELoO20mfgXlb8xK++3mUUq5M4l7pJFvRzPL6GpUJ8BqBh/RvXZ8y/F/Zg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(136003)(39840400004)(396003)(366004)(451199018)(2906002)(44832011)(186003)(86362001)(26005)(2616005)(8936002)(5660300002)(36756003)(52116002)(6486002)(478600001)(6666004)(6506007)(1076003)(83380400001)(38350700002)(6512007)(38100700002)(316002)(41300700001)(66946007)(4326008)(8676002)(66476007)(66556008)(110136005)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MwdgTW1PvxQ9wHyO4zOqfOaCgqtum4vSfO9U4GMCrGsPfSl1faIoahjHB4Z6?=
 =?us-ascii?Q?l2CoKEngpCswg/3gDrhyG7DhMChzOhEOEm8dJAqJOH9BDewXBXQLnjz0q0Nz?=
 =?us-ascii?Q?dF1O85oMTGvG3pgvV6llDYPtX40KHuB+wlhZkpHpexEGWTKEkuS68BkMUoAn?=
 =?us-ascii?Q?xZlSCX+GnYgTJqkVHh1s0/jMNI2HtWeOaeVte++LUTaolkGjztyX3iD1L5tL?=
 =?us-ascii?Q?Ls3rTglnyGymt3BVRr+0HczeT7zftNIId/uKrghVHw0gi9ZzOmguDlhEl9SI?=
 =?us-ascii?Q?qAUrGLTzX3EDFXzpwKxalKKFpnwimocMwNyOMyoOLmXSh3563dyHSRmdIlw8?=
 =?us-ascii?Q?tCejZQ1nCe/CNaS/3lGvhA8uluF4dnWlGL1GcK8g6ialuQcwL2OZaMII8TWM?=
 =?us-ascii?Q?GdOBUmWG8CGXzWBU7Hy7lXm9gVDK4a/1gDrM/k/C/BjmmeQArx+1zPkWB4Xj?=
 =?us-ascii?Q?soa1FJRMjjsp0rC3q+8r4zQwsNRYZffrOF3mfSd0iix3JFm1L61HI4zELxUx?=
 =?us-ascii?Q?TycRt2Bn5XardpTCv/eRvOxVSCbk0dWRNzZGkkFIyK10rj6xSr1wQEgGcZIj?=
 =?us-ascii?Q?1EuJ9vThDCrdRQRU8FM8rmj2bA4k5/EVUy7sD4bz75FJsDRFTMBlYZS3FOhv?=
 =?us-ascii?Q?ZIP6zwDxlIwEG9Awd81fIuYxT1ZhjucvxpUmBmJTCBwSx+ZklhZQ657xCQ/h?=
 =?us-ascii?Q?bMpwHz0w3J9oEa8Qwr+e8wVteXlUyo3+ddU166KsVnlVn8rNu249dGbvzdiZ?=
 =?us-ascii?Q?MEah3SLNAFo71vRqHfbrNKnbHuMB5+zQb2cnHT9fbIX5xFhFxIIqKaK6yr9s?=
 =?us-ascii?Q?Rihtn1dzEsLkUD5roEvPd8Jw08tYjPd4qxcDE7XtrAzEvN/v4iDVMpDH9XBv?=
 =?us-ascii?Q?WvPjObP8ofe2MkF/eHjBDVgOKucDMzWYyx6U39DZYBgJFJjbQX/Qwnhd/6T3?=
 =?us-ascii?Q?E2VYbpYAwQF8h9MDrz6Eh9Gte/HIDSo1gaRXbzCM6dwixLCr7kZZwhpgR1SO?=
 =?us-ascii?Q?bWTM9vP+wB60ddEdb2AQCnRJ7m4XEwAi6qS9dN7UJwo42UpxMg8B6JR6piLj?=
 =?us-ascii?Q?HNpXcZGJVWn2biyxaDD6renW/gz608wUYTDW+QfkHVMVutPXWSUynhfr9wPh?=
 =?us-ascii?Q?JbdN53j2AkBmilACFDH/6Qp3aNK2C943kltQvXcr6bj1tW+87eZiC/aweIlW?=
 =?us-ascii?Q?hkpbOQYUdLGIMl+/qvykPluouHp80muJ5M2G2xAIOvTTPTpuHTu2WNIoG4OQ?=
 =?us-ascii?Q?oMvDcC+EMRywdP590uxlv4m1DAhlVbPJR8gn1qVYby3W0atRN0FxA56Dmpfd?=
 =?us-ascii?Q?Jte33NOR1vVgrliuL/Yd4yx4V9Oc5F9kCmO0q4JRX3nd2IwbRjWGfJVyut6a?=
 =?us-ascii?Q?WZ1lD4aV1L9SXZnMQIZn7uePgTSEUo2YfsXhDI6OuoQDs2gyOo1yO9XoeBn8?=
 =?us-ascii?Q?sBXsD6xdOLT94GsezGGpuF+D8npgYZtDaMWP32uCOLNbjS2m2NOt29tL3mKI?=
 =?us-ascii?Q?hibrBqy3A6C9kJqNz54j42yohXK8iEQq/qPhK8Lza/B2kpmNgNrO4hbMEpOl?=
 =?us-ascii?Q?x6dYeF53+GB7FdYUiZpUAN6zjTur4ZFZLoX+AQFEL4pU5NFeT3RIhb3mVikQ?=
 =?us-ascii?Q?BA=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 16bd94f7-8783-4cff-67eb-08db0a7a9587
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 08:49:41.5742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2njz1WU9rmVyHuixpeXibjGjTgaU+SWsPjDf3FXYzOnRu+AJ4eAKnLTvzQ/YQRzA2bNfWcDZnagHBRd/NWCANdAbEa33llsI/TWTmIjTjgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB0827
Message-ID-Hash: 3R3UU5MPGVRDENGVWXT3LQFQSCTM3E4A
X-Message-ID-Hash: 3R3UU5MPGVRDENGVWXT3LQFQSCTM3E4A
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Kiseok Jo <kiseok.jo@irondevice.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3R3UU5MPGVRDENGVWXT3LQFQSCTM3E4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In SMA1303, this device does not support MCLK.
So it need to remove sysclk setting in devicetree.
v2: Modify the sysclk setting - using devm_clk_get for mclk.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/sma1303.c | 37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 9ae4e3cba3ae..727c01facf52 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -998,10 +998,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 			params_channels(params));
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-
-		if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK
-			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
-
+		if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
 			if (sma1303->last_bclk != bclk) {
 				sma1303_setup_pll(component, bclk);
 				sma1303->last_bclk = bclk;
@@ -1680,9 +1677,7 @@ static struct attribute_group sma1303_attr_group = {
 static int sma1303_i2c_probe(struct i2c_client *client)
 {
 	struct sma1303_priv *sma1303;
-	struct device_node *np = client->dev.of_node;
 	int ret, i = 0;
-	u32 value = 0;
 	unsigned int device_info, status, otp_stat;
 
 	sma1303 = devm_kzalloc(&client->dev,
@@ -1700,35 +1695,6 @@ static int sma1303_i2c_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	if (np) {
-		if (!of_property_read_u32(np, "sys-clk-id", &value)) {
-			switch (value) {
-			case SMA1303_EXTERNAL_CLOCK_19_2:
-			case SMA1303_EXTERNAL_CLOCK_24_576:
-			case SMA1303_PLL_CLKIN_MCLK:
-				dev_dbg(&client->dev, "MCLK is not supported\n");
-				break;
-			case SMA1303_PLL_CLKIN_BCLK:
-				dev_dbg(&client->dev,
-				"Take an BCLK(SCK) and covert it to an internal PLL for use\n");
-				break;
-			default:
-				dev_err(&client->dev,
-					"Invalid sys-clk-id: %u\n", value);
-				return -EINVAL;
-			}
-			sma1303->sys_clk_id = value;
-		} else {
-			dev_dbg(&client->dev, "Use the internal PLL clock by default\n");
-			sma1303->sys_clk_id = SMA1303_PLL_CLKIN_BCLK;
-		}
-	} else {
-		dev_err(&client->dev,
-			"device node initialization error\n");
-		devm_kfree(&client->dev, sma1303);
-		return -ENODEV;
-	}
-
 	ret = sma1303_regmap_read(sma1303,
 			SMA1303_FF_DEVICE_INDEX, &device_info);
 
@@ -1783,6 +1749,7 @@ static int sma1303_i2c_probe(struct i2c_client *client)
 	sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
 	sma1303->tdm_slot_rx = 0;
 	sma1303->tdm_slot_tx = 0;
+	sma1303->sys_clk_id = SMA1303_PLL_CLKIN_BCLK;
 
 	sma1303->dev = &client->dev;
 	sma1303->kobj = &client->dev.kobj;
-- 
2.20.1

