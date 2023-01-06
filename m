Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5329965FD74
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:19:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A8C314116;
	Fri,  6 Jan 2023 10:18:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A8C314116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996750;
	bh=DeeAFtXmDT+8oA7kUEV6ABe2auFL5wHwJT7VXp5Ch+k=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Sy4PY0eqY1ceMlLeMudBuwncqeHeU9muE7MG92h81V6UTRG+fS87ylVOczCDFwfoN
	 kvrmOKT8ro0aIZQSy8k7jlQFBTQiTLcz8OL96mx8L6F2yovNB7uOi2xdYdyMLsMxb7
	 bmv9Br/Y9hntgu5FGr2dEXccXEmeaHk38eyNoGRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ACCEF805A8;
	Fri,  6 Jan 2023 10:16:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FCE1F805A1; Fri,  6 Jan 2023 10:16:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2040.outbound.protection.outlook.com [40.107.129.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D490F8057F
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D490F8057F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLp8ZkHgy2VjUAK2T4OLKdHJ24AFXbu6HDSTZvYX6GrdkiomyzCwIQT4DX/ufBBMOuGnoNIxS2uKETF7SRVeh1pr0FvmfdXj4FPCeitrm4BX2jAJQXvoufGppDTzxllKib7L05XfZeq3U+DsGgJqRGMyLiE0bctuv2W8veLALYgFT3YftZdxbwdKzXmmDEpeDntq19yUOuJwsESZgXo/5z/4dvWnYDsJ0fMcNyu2AuGOX4Y0LJyGtIac3doBbQ+nNwK190zamS/UWtPSh6znjaPzqic8cZalxHsj1l7kt+5iiFxI311cClPuNrHmD0yBfP2Y3Lc83xK/78lya0d8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfbqfqzrEtFV+lNjacckbF+nKmj6LXEuD2IPrrMdZWw=;
 b=UqZJBc49YoRKWFq72EPDgiaC2AElaJQeRw2MPlAaE9v+fwUZruCICm3CYPWsz2oK0pMfTK7H8f7CQQebz8lbN0ii25R+8Vjbn93rlmRVtsloquJecrJnp4Vrm8wO0Mc0mXnrP8yy93tNY6c3oLKv1lLSVy9Y/obn/Qv4gaTeBgXkLeIthmz12SbPnisUo5MkbztaLu3z2fbycbX0ZeyF/Nv/rVnHE6Hgy/oKQ1cvBYoMBgt9bXn2tEXr69/rKF59S6RBNGjNv+Vt1+EAbLogR9K21oiielWUlH5HT56PVOo1s3yJ44pVy8VYhm3a2rbWDV7i//iXBgNsS1bX/942Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:16:00 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:16:00 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 09/14] Add the prefix for component controls
Date: Fri,  6 Jan 2023 18:15:38 +0900
Message-Id: <20230106091543.2440-10-kiseok.jo@irondevice.com>
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
X-MS-Office365-Filtering-Correlation-Id: dbc9faa0-a1c4-43ea-c4b2-08daefc6a02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gn7R6IPANU7PFOaSkJY6tm21DgxEQ+64CNUog5F3YYitzCjvPNVEUiZrSyaa+SO5abx+SSe4CYh5gQL691LmKYl2GiCduXFubV6HxtWfLYeHs0EJ9GoH+zkg5/vKCSA+kiXcaa2MXhZYxbNZM0WS39yG00aULhm1iyjDDCvIp2ZRSDrXHbxYzCZcHW3a6uYyrqYHqHiFROc1A41hoPHwC5LWfcqRqt1bDB/Xcxy+SjzUS/O9OOCljYLkjZiR3wHqN7qTHN4EDuS9JyZJQisqk1oyOoPq5aSvPDgJ+NeoUWfcaXGpAk4CzWZKkYPo3QBCNOnyifmmxPKTGf1Z+k3khpxHfmdQvQHhayWK/QpSZCU9nFzLpIz6k7+POOO+6W+TQygyUYmLFuJ9uAk6au8OSisJekJX0lpk8xorzgc30iZ64ZZafyK8jHQjZMsv6jzd8uJRigXoqXUbeFDUrH5S3Us+ikW292BP4x+T49Kj0jzo6Z2PgLgB/lu4IKFu4oUxAC0W2Oxw87ZGFOr+sXWtr318GjdEwARHmT4XpVKRKhUCh/WKrPkSdMb8yqAmib9lZpH29Xhwmw/DyieHOxRlqhOH5wDi9NQBfMlmfDBMb7iHly0poSTfCrS7lWBgCW82PVvJOVm+gEUyOY408H+l/0OZB7XrAFzV62QLW0QN6Ux1UxmbhswZpxDEpDg8Arg4ifo9kZit1EhHoShwDaEVfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(54906003)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lzZxtqtzk6o+1+2q1OW8ehiQNuufUNa2pswfY2ed5o8eluKxCJpjRQpW8Ca/?=
 =?us-ascii?Q?sVAVOyfgwnQ43vycWdqHZ7XOSksvLc4kzQyvFHRfLqqzsqLSjIZLsl+zaIxm?=
 =?us-ascii?Q?6YGFKa15eglwcXh8pfKJTFGbC0MAKufq89A1Tc8Wu1m5aYdFZUh37KHMfn5p?=
 =?us-ascii?Q?JRL0sxAvTg7s4KGuITxa9ht09t3KCCWNIhT5+B1ZFqWIXMYw/FzpjnpuSjvX?=
 =?us-ascii?Q?ULD+1xR2pSL4Bza0s/SMqMu39l8+8DU0TJAbpcQkZmJgXvJldcWC0A6h5ay8?=
 =?us-ascii?Q?TeAEjOUtFCqfp4WtmNtFnJ/kE3fehyHBvBKV1w8ICauip6FMPI7Zz4hmQFKu?=
 =?us-ascii?Q?pNLdXpjnq+eaoD2c6EZbm69pDik6tJqkvOjjVvP+755kPLgoB4Bkvx0W2j2m?=
 =?us-ascii?Q?9toEuEQFTvRha4A8ejUyI7HndtVSThPo020tj6gWPHOCSHD0tZqxRq9u6fuD?=
 =?us-ascii?Q?FgzQyXpiQD147kTeUW51U9Z2TrNt4jqE1BJh7hViZbVhFgn8JEDCWfcD5Blv?=
 =?us-ascii?Q?guDWFgyo7wZVrtCgZoojJPUdA0niWrGp4w9mWfROK03FY2Jve3QyrE4B2O5/?=
 =?us-ascii?Q?3RFkOhSO06TieE8CFhv9oKSXv0zp1nOAaCUmY+oQQiJ9U8iTs5KPF+yUAQT+?=
 =?us-ascii?Q?tXrm+xnKnsRT0omAERGcH6JLtzpFwI9RHz6VMNuAzxJZlolg8kd4Qi3eZY/t?=
 =?us-ascii?Q?TUl5gKWC15m5ZaUVNB9ExrYJsqwjFKQ5EheC34GauX5p1lmSKB2vtOsT7V0N?=
 =?us-ascii?Q?md2V34EWnekN9NibOV9Q87sdixHQm3/96XZ5yD+1qkitE9YAdYyrGPjUCfWt?=
 =?us-ascii?Q?RtbEThtfC6E++IsAa7qvxKt+n4oMZV34Mr3yIRKcPNgudeuFZU/L2YIg7EmG?=
 =?us-ascii?Q?t6a3K/OnI6TzbgHWjyC9iir3OZ8Y48pFTHS51rTIE2VptS4AIICUxXbmLvSD?=
 =?us-ascii?Q?H3ePwBQODikLXlnP1m1vI6Irsv4qQli5o/suZo8mvzvsfJ6ItfjdtH/VZveq?=
 =?us-ascii?Q?Tt+057OUWbF5wjB50AZ5KkUVZKzsuU4UDebogC0DMhe7Un7Q9fb3F7+Qp+27?=
 =?us-ascii?Q?C/B6FkscGBJNVx/TdGdj+EeYBIXpmjbFWmhugpgKWWUiNq/IEQKOdusuks4h?=
 =?us-ascii?Q?RFalJxTlyACwO5VcYKDGlvvtclBRI9i0oeRBwNzAt1ESOYNmzoUAx/cSGTjs?=
 =?us-ascii?Q?7OyjUTM0GeLX8UlqbpqtYIXzeLnRJNp/auNKQCnfFwB+M87VXU3qeg/DHVHs?=
 =?us-ascii?Q?mHig8r335qANnropDrhxwrKSkx1qUhayJr44opOzfJCJAqWkH9fYkpn2JHl/?=
 =?us-ascii?Q?+lyoCXbVxhDYDoi7dcZoxKCOlgQMwH29zT0EFMu9hUgv0+1I0egp3XMrSmJW?=
 =?us-ascii?Q?o7rEpWCudQpukaSVOIkDojO3SkdYNZiRGtVICvVGbHq9ZTQHVPKq72JFuX4q?=
 =?us-ascii?Q?IZFY1llJ3ycgVCBYoTRqbk4a4wA+X79OR8jICj8CZjaZW9naXfpNQk26ATzf?=
 =?us-ascii?Q?bZZKjT6czx8hGozSRmiZyPBR3AlAg7wJ/b1KHDYERCK6Eo8ZRpCzNhyMKjol?=
 =?us-ascii?Q?WONbjuP4eO6Rs7fDWj5BkPx8X1c1uPpV77Tvcqi4?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc9faa0-a1c4-43ea-c4b2-08daefc6a02b
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:15:59.9726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhQYtZX7il5T83BT1qLFT4Ao2kXFB77Nmeth5iZRItDtNmNDfVyH6RreLDSuKjgPzDyCO01MBaSQGyKue9c7JkMGT2MM+n6/W9V61nNpk5Q=
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
 Kiseok Jo <kiseok.jo@irondevice.com>, kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add the device name on prefix for component controls.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/codecs/sma1303.c | 79 ++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 3a60927e20aa..1991c8d21ba3 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -29,6 +29,7 @@
 #include "sma1303.h"
 
 #define CHECK_PERIOD_TIME 1 /* sec per HZ */
+#define MAX_CONTROL_NAME 48
 
 #define PLL_MATCH(_input_clk_name, _output_clk_name, _input_clk,\
 		_post_n, _n, _vco,  _p_cp)\
@@ -88,6 +89,8 @@ struct sma1303_priv {
 	long check_fault_status;
 };
 
+static struct snd_kcontrol_new *sma1303_controls;
+
 static struct sma1303_pll_match sma1303_pll_matches[] = {
 PLL_MATCH("1.411MHz",  "24.595MHz", 1411200,  0x07, 0xF4, 0x8B, 0x03),
 PLL_MATCH("1.536MHz",  "24.576MHz", 1536000,  0x07, 0xE0, 0x8B, 0x03),
@@ -825,6 +828,47 @@ static const struct snd_soc_dapm_route sma1303_audio_map[] = {
 	{"AIF OUT", NULL, "AMP Enable"},
 };
 
+static int sma1303_add_component_controls(struct snd_soc_component *component)
+{
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	unsigned char **name;
+	int index, ret = 0, size, apply = 0;
+
+	sma1303_controls = devm_kzalloc(sma1303->dev,
+			sizeof(sma1303_snd_controls), GFP_KERNEL);
+	name = devm_kzalloc(sma1303->dev,
+			ARRAY_SIZE(sma1303_snd_controls), GFP_KERNEL);
+
+	for (index = 0; index < ARRAY_SIZE(sma1303_snd_controls); index++) {
+		sma1303_controls[index] = sma1303_snd_controls[index];
+		name[index] = devm_kzalloc(sma1303->dev,
+				MAX_CONTROL_NAME, GFP_KERNEL);
+		size = strlen(sma1303_snd_controls[index].name)
+			+ strlen(sma1303->dev->driver->name);
+		if (!name[index] || size > MAX_CONTROL_NAME) {
+			sma1303_controls[index].name =
+				sma1303_snd_controls[index].name;
+		} else {
+			scnprintf(name[index], MAX_CONTROL_NAME, "%s %s",
+				sma1303->dev->driver->name,
+				sma1303_snd_controls[index].name);
+			sma1303_controls[index].name = name[index];
+			apply++;
+		}
+	}
+
+	ret = snd_soc_add_component_controls(component,
+			sma1303_controls, ARRAY_SIZE(sma1303_snd_controls));
+
+	dev_info(sma1303->dev,
+			"%s : prefix=\"%s\", total_num=%d, apply_num=%d\n",
+			__func__, sma1303->dev->driver->name,
+			(int)ARRAY_SIZE(sma1303_snd_controls), apply);
+
+	return ret;
+
+}
+
 static int sma1303_setup_pll(struct snd_soc_component *component,
 		unsigned int bclk)
 {
@@ -1443,39 +1487,10 @@ static int sma1303_probe(struct snd_soc_component *component)
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
-	char *dapm_widget_str = NULL;
-	int prefix_len = 0, str_max = 30, ret = 0, i = 0;
+	int ret = 0, i = 0;
 	unsigned int status, otp_stat;
 
-	if (component->name_prefix != NULL) {
-		dev_info(component->dev, "%s : component name prefix - %s\n",
-			__func__, component->name_prefix);
-
-		prefix_len = strlen(component->name_prefix);
-		dapm_widget_str = kzalloc(prefix_len + str_max, GFP_KERNEL);
-
-		if (!dapm_widget_str) {
-			kfree(dapm_widget_str);
-			return -ENOMEM;
-		}
-
-		strcpy(dapm_widget_str, component->name_prefix);
-		strcat(dapm_widget_str, " Playback");
-
-		snd_soc_dapm_ignore_suspend(dapm, dapm_widget_str);
-
-		memset(dapm_widget_str + prefix_len, 0, str_max);
-
-		strcpy(dapm_widget_str, component->name_prefix);
-		strcat(dapm_widget_str, " SPK");
-
-		snd_soc_dapm_ignore_suspend(dapm, dapm_widget_str);
-
-		kfree(dapm_widget_str);
-	} else {
-		snd_soc_dapm_ignore_suspend(dapm, "Playback");
-		snd_soc_dapm_ignore_suspend(dapm, "SPK");
-	}
+	ret += sma1303_add_component_controls(component);
 
 	snd_soc_dapm_sync(dapm);
 
@@ -1534,8 +1549,6 @@ static void sma1303_remove(struct snd_soc_component *component)
 static const struct snd_soc_component_driver sma1303_component = {
 	.probe = sma1303_probe,
 	.remove = sma1303_remove,
-	.controls = sma1303_snd_controls,
-	.num_controls = ARRAY_SIZE(sma1303_snd_controls),
 	.dapm_widgets = sma1303_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sma1303_dapm_widgets),
 	.dapm_routes = sma1303_audio_map,
-- 
2.30.2

