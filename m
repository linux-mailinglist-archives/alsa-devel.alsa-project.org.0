Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598FC493A4A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 13:32:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8EBC2AE4;
	Wed, 19 Jan 2022 13:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8EBC2AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642595553;
	bh=9Cqfca4Ybx7g4hchcKNvjTYkQSQvXpiijvZ50oVLjfg=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L4Gx92hBDH8+zePzpPGZftC+ZQwtBDvlU6YZVFzTOElf6fdKoo3/Hk8U8weanceZ1
	 XhTjbsM5QuYnCMC33mgj5TdkErePZkuhusItEwZ7QiuUbNESYyw3gJa6oF5xtbsH3p
	 1Ez7O4tQDVlbsMXWMIGRF0E6XYmSiO/9aoKnnNkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38890F80212;
	Wed, 19 Jan 2022 13:31:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F40DF801F7; Wed, 19 Jan 2022 13:31:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_138,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C216CF80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 13:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C216CF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="e/ggI+MB"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="x/1pAihY"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20J9lLoK000680; 
 Wed, 19 Jan 2022 12:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=25sgiOJA2YBzJUvQLKtMG7JsZxs84jhhTT5oK/qJlr4=;
 b=e/ggI+MBWGW8Zev55ZfOZSduUUMU6KrRfHg7sy7u0BhEi1s+Sac1YzUD9+ABb8gFO237
 jt4A//YEsUlvZhaOt331xqlcPmcACaRrN4nJTYIEaPvXp30RYhpqNUm4mbCTALfCrsoX
 57Ado02Lo2ksscZ7Rv5tdEjkidjCpFz8Q1NDPiPxStEtquQ1UXRgxUtSxCIBZ7+s1RmK
 qCyw82a+SL4Trgh6c7AxMyP2C7Olv899S8wr7p3eoCicEMKcTgFaXVlea78d2JhZZ949
 3YdSRGkhejQKOap6PTA+TaImqCFoKrwT84oxHcW1yBQz6pSdiVIum18TzwcphulqxuRM wQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4vn02d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 12:31:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JCG55W033396;
 Wed, 19 Jan 2022 12:31:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by userp3020.oracle.com with ESMTP id 3dkqqq8vbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 12:31:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDpsFj/gzVzCjjHMNgvJo2KVfdCZEN0epKa+M3eMy+777TnU3e4AZSVroOXwnckBaTKuywMx5rB6p5089t5I3jLiMK/LuGwqpkhzzRNMPeaFLNi35C+hjW6A8+UEtB4iOOuGDCnsKZ60SN41emAjHafsk6FrIJM+5eS8iHcGcWvNKmWstOQrJ9xT/swXP6kezXrDEjQCkuMLRf60UjVavQaVeUuzEAbKxcT8kSmz7MqRhSZyV1bT18hvqcOUTMi3rkOkq9H1V1QJuXbnNYY5+rZZS0PXY79nQhCP8cSVWE2G3P8VeRSBMYio/qgsIH3Kthk3DhvyYx8J5/sUuYxL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25sgiOJA2YBzJUvQLKtMG7JsZxs84jhhTT5oK/qJlr4=;
 b=Q0FOLumzw2C1PmG3rKJr5oiCzTAiue21zaLjEo24dQ0Sz66hb3F8j0frCQVhb5RCJK5xva/uTjD6kGU+9sg4ge6PqU4nnN5oq1YWbxMY7sR3nKh1sHUQplGHFEA7nPWCMLVk0uYa7Gjob+nIP/YscELjYnwOf236XdqNtMpacHYXzaWsClfGThuzwZ6aHsXlmmD/SuNF0lMrdlfnszeR/feq3Q6vN+9aRRT4KJiUAelKobauYWObtzuhSKxsZHY1WCvWOZYGzxXVbsuYyLaLdr5EszdqqY5G41TBEcmeogpNEcRDishq0mWttQf6u7iB5pZPnv3e6o4d10Q9mW1wFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25sgiOJA2YBzJUvQLKtMG7JsZxs84jhhTT5oK/qJlr4=;
 b=x/1pAihYMio6lDoUcjOKvsrc0OuP66lyoAGIHuI8RyvI6y1uQlJ3SnP85M5eoFaULDlyBdmriRwNWPeDiKjpL0Tb4k2vHX9gBy0AX4k5OLh/6CQFv1peG0NeyKZG6STDL7p59schPfLwDaNXEc3OTrkSrRdDpPN5PbsGxQq+kUs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB4287.namprd10.prod.outlook.com
 (2603:10b6:208:1da::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 12:31:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 12:31:14 +0000
Date: Wed, 19 Jan 2022 15:31:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] ASoC: max9759: fix underflow in speaker_gain_control_put()
Message-ID: <20220119123101.GA9509@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0033.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd0b9d0b-d00f-4af7-9417-08d9db4794ef
X-MS-TrafficTypeDiagnostic: MN2PR10MB4287:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB42872608D31BFED6158943278E599@MN2PR10MB4287.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWrRGEoHPq1xxIyxCsR5pXFuqxFymM8ip06YFHDBF5Rfru4c7vVlg94HETR7CtFCClb4tyIDDGIutm4YRhAyOCckWKJFjASFpxnqtgYWjWkX31/LSsmSinkZNIf1QR6AxxH7r/h3LDHBbyY4k/79wrVrdrcjtJ4rP+Q/5iBDD4k2vy5YWueeXVlkzc91pwsmqV/BJg1qhDTGv25dpWQXab6M38XpP048IxSiYfjjHoqUdd5mUXmULLcmckCZUS3zSgV+Uf7hZRteVl0hLabi60l5+4dFL7MMZxOpT2Nw1bNinOSFDFcOyqKPyzZfo154syL/oSWk5xyAqiPjAEbVW6HYZCQtjG0J2uQ0xSAbL5ETZ47snHS9XW+ENGBRyygs0aCBH+Q3u7BSaI+UCtZXulh9dG7CqAKoG0/9tngzbs97tu7pj4CLacV9fW6fglcOd8t9ncBN+9Gbr+fGkBi+R1NL9F/5Z6KqT8YHpciCZY0AzHTu/pLdyFdvZmUIDacVs+HWjOeV+/qK33jB418XBbQlbVaE8JPCOcc6nCpPF6eXytZwUkoEZp/k2ccKNrhl7OGHiwRhp7IYFRiuNf7jKQ4u9iq2c+PN+e1Z6LgHYzN/3qRuLMX6daQfJta3rZHi3jO2I89CEomK43UtC4AjjC+F2MCHqK427Ouq4xM9RmqvyNk/Ehf2vrnQ1HHGgqY1b7vU9f6xqs78nMGcT+VP/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(44832011)(52116002)(38100700002)(38350700002)(8676002)(2906002)(5660300002)(8936002)(33716001)(6506007)(6486002)(86362001)(4326008)(316002)(26005)(110136005)(83380400001)(1076003)(54906003)(66556008)(66476007)(66946007)(33656002)(508600001)(6666004)(9686003)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BZwES9OB+e4NTPXMsPyiclrTYaWKBK6Mz/vOh0LI2wPOChNivaZKQqyul0+6?=
 =?us-ascii?Q?mVzWNIgBCUkYFt+8bbcpx7Rlss3KCSHb/GjfbhvqQZC1RvFQDxtIOf5fHYI2?=
 =?us-ascii?Q?yhXPBUbA/WlFDpHtyo5wZlSK6l7GiLj96HFRIWkwoNuXYIQPJgPyTgcKsxm1?=
 =?us-ascii?Q?ixJpxGIIesy2ISEh8cj604FzZWzrU3nlMN1akuRooscOr4/FnMw1PWkgijDZ?=
 =?us-ascii?Q?Yi9QVniXtzuQx2b03YQce/eGV7fmMzrjKfp4bLFtQka4AzWU6VDaaJAvQB5p?=
 =?us-ascii?Q?ul7KdbxUkdL9oEvHC5jMPF9QIyLsTxKVnWMH3J2feU+SH1i6LXppU+t/zfY0?=
 =?us-ascii?Q?MsaQ0VSdBe0aHRwRsagcj3cl5HNfm0KDomjxqc8Q5Rn47nkt1WEC6Dl3ypfO?=
 =?us-ascii?Q?9t1Jj+T/HFaJ7b+PI9SyDT63aFXZ9cx+M5BiRsQKZ3dH2KyRzK2ijCSk2Wtp?=
 =?us-ascii?Q?CzJ8ylA8Hfkm1R5WN3C0EsuPQFe+ropgBOF/CFy04gynjK3QgVXBDlqyy5x3?=
 =?us-ascii?Q?SravuP9ucOPlIa9QMW4Rz2JC0uwFzFSsDC4gYUtUhEa4DIKUqdItB/EbpA9f?=
 =?us-ascii?Q?/gM776doHYvg01bdDr9m5xkxg0PlsSb8uT5zsAyOyVSBTGsCEv7II9golPiZ?=
 =?us-ascii?Q?8Y/QBHt1gF0iYnAmAm+tVLTpOJddizAlKM2hE8nPZmrdwfpnrelM9F+pNfsT?=
 =?us-ascii?Q?rdSjHBrw/iZDsb9FmbHnVSLDgHut4g/JgDfhNchRDOooyoNSGGK/ETcEh7nR?=
 =?us-ascii?Q?k3C8DJcMPzRIO79LVU7XL4j1eYH19RNkZdLIlv4DkFNtlPRGnajpFTsrtibt?=
 =?us-ascii?Q?Y//xjI6OC/g7W9ukgCpqZduNQlA25zM591Wu3aIiGmYVJ0krV6SW47M58our?=
 =?us-ascii?Q?nCYj9yoUXFsCA1/1bqR/yGSI7tTRq8F2xV/Se8kBFH0BX8Aqijr/3C40vCTT?=
 =?us-ascii?Q?eWROge5xMGYo+ANidVHsoito0ZRwkknERX3O8oaP01rXV5+3+IEMsKB9Aevb?=
 =?us-ascii?Q?4VCWz+DKVBR5K2UwBEdHemWmacNqRFFU3hmPOSpPcRA+nuniCkYIcyUuYU9X?=
 =?us-ascii?Q?UuDkmCKYTktKAFRua3mNOvf0Auc1i0p+w9Vvb9JaDhSX7eWjiY+A16wmPa0/?=
 =?us-ascii?Q?fN7SYZR5zg7WhNoeR+s6KGrYibaD84yHjEbavmGIaOVdczDr72+invDM6aPo?=
 =?us-ascii?Q?q5vqbPNSvWtbuh19zWx9HAaHE+/K7V54cMqsBfbj4tQFhcDDRYNNBmhtFJxm?=
 =?us-ascii?Q?JhTZ19ofx1VJnIhRJH2vbDMbGCWOhcvCmXntVTAdO8qqm5MCX2vxDX2KIcMO?=
 =?us-ascii?Q?stHdXPUIPkiffze3wbTT2kYspwdKEReaHnerWWN3uiGuf/KASjIb25eZgv1a?=
 =?us-ascii?Q?ey8IPY4/4x/8l42A/Xd//k46EouK4+VTficTK9n0ozcUrPxmGJ2BQeuuDnJp?=
 =?us-ascii?Q?3h6sTC1yXkazVqTCwVbv6QjYrBV/SAu+BLvry2N4WNVGZnNkIwoTsPwzyh3d?=
 =?us-ascii?Q?94IhTD3gPR9LhXat+Ov8vR9nsna4oVPWF8X60pTjs8HP0lL3WGww/66Ni9HE?=
 =?us-ascii?Q?OWWg6lwRJbYUPpuK6/g66YNj0vgJUWIFk3noRAH6+hM713nCM8cROXG7DsB1?=
 =?us-ascii?Q?Eq+l0sszPb3IfC19TXJeYZCzIdze2373UgDqVlzjU9H7Xkljd0MSoHQOHWNC?=
 =?us-ascii?Q?0PVg/ymD2jdLSoWXssZfvwIfu2U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0b9d0b-d00f-4af7-9417-08d9db4794ef
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 12:31:14.0494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJ2ofA+S7OBGYN6sU34d695xvcV9JmXgZdp3/d1nRd/Oug0cF/kPp29w/wIVFkxId0P3Xejn/rewwJRmyiquvbfF8uZYT+k1dcS15HnlkdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4287
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10231
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190071
X-Proofpoint-GUID: XP_ysqcYJNIYOHSGaFtRvzrwMvwpwBo8
X-Proofpoint-ORIG-GUID: XP_ysqcYJNIYOHSGaFtRvzrwMvwpwBo8
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

Check for negative values of "priv->gain" to prevent an out of bounds
access.  The concern is that these might come from the user via:
  -> snd_ctl_elem_write_user()
    -> snd_ctl_elem_write()
      -> kctl->put()

Fixes: fa8d915172b8 ("ASoC: max9759: Add Amplifier Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

This patch is obviously harmless but I sometimes get confused about
these sound get()/put() functions.  I have some code in Smatch which is
supposed to manually suppress warnings from snd_ctl_elem_write() but it
was four years old and has bitrotted so that's how I got this warning.

So I remember these as being false positives where Smatch gets confused
but when I searched my mailbox I just see similar patches which were
applied.

 sound/soc/codecs/max9759.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max9759.c b/sound/soc/codecs/max9759.c
index d75fd61b9032..bc57d7687f16 100644
--- a/sound/soc/codecs/max9759.c
+++ b/sound/soc/codecs/max9759.c
@@ -64,7 +64,8 @@ static int speaker_gain_control_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
 	struct max9759 *priv = snd_soc_component_get_drvdata(c);
 
-	if (ucontrol->value.integer.value[0] > 3)
+	if (ucontrol->value.integer.value[0] < 0 ||
+	    ucontrol->value.integer.value[0] > 3)
 		return -EINVAL;
 
 	priv->gain = ucontrol->value.integer.value[0];
-- 
2.20.1

