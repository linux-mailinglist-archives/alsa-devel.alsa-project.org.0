Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 246EA33C290
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:55:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0787A17D8;
	Mon, 15 Mar 2021 17:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0787A17D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827307;
	bh=AjAXBP2Zz3m64gYzUgab/jdsBychXjH+TNYIfsbbX3o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YdhxCiqGybmjmso5AYNXwBSVJY+kGth/CapAiuZcz7iM/UMwO8I2JSK2J1hKDGlAR
	 5NwfQVWcLa3d1Id1LzaMa1D5AglGs+8SyigeF1pvMwvMwptqztd3eYoCPpEk/NtRRi
	 upoaEOyJ8uMdq0KvkQ7mvpxs/SdVjoMJ2qzWSP38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E2C6F804A9;
	Mon, 15 Mar 2021 17:51:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB35DF80171; Mon, 15 Mar 2021 17:49:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255047.outbound.protection.outlook.com [40.92.255.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8561CF8013F
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:49:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8561CF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com
 header.b="k+ml40Nu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVQn1c/spg51nW8d+oX/zlEkvuAxttsgWbbpf9WCNCGeFp/Bd5T+6LYF3EFiUuaN9Hqyh5POQ8bTua2qMbmvFDK4+PTf5EeUQ5kOroq7/NMhYKuAFdTehbNGqCVni4R0bXBq6jMAVFJH1mY6s2BvM6aBlOYHc/3lvpRqrWS/k//UDrM0gpI0tGnrhjhR5eayWBfCJJZtqmLhFr05MiiyaAJEyMi0txnIvTnc309vUxlEjyI5U3eGiVUZT6sz6EG4JHGbjrfgCQVI3o1kFN1Uv1hadX62UhYRCcWIhoa2eLV6NxXh+AwH2JVgHAQ78ounH+q/OOaM92lDbI08A94nSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbutjiwyxmiXyOMM3I0Tk5EZXIdhyqkew6Js0gzdf5s=;
 b=Y0CI3E2gY2DFFp4CXegmrRsvuSI43o05xwbhJ1KhhT6gOMKVVW9olEcMvfxS6VPbxrU+gaXCcZT2/ys5tVRRxyj4NJwlcSYV/N2/Czm21e3bwxy/Q21SEtvlHRqzcQTcp1GFbAsXsMSd7LbNOWV6WLuRIeuQJScKXabPkTS1nytwedPuoVoj7ZbliAEP66HjW7ltVhAXLLZ6oCPmuzoqFpZ98LPRCYwMJi+ErarJjMRmp1lS8AAwtdK9UACJeXcK+7uthG6IARYctWUJqZZyJshDEeeb0MZtfLRGN3tf2Ct+h5pQdOFGk6RFGmblJNwbfe5E00XbEiPe3R0bFHKEFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbutjiwyxmiXyOMM3I0Tk5EZXIdhyqkew6Js0gzdf5s=;
 b=k+ml40NufamqyMgHyTEh8P3/Rvs/UOk/qqh1WpDP0gZrrBFzG3g6qHVz76WH6zJh7C+/Ekr+5UOAqfkiTmfyVTqwELyt1m0C6azxB9MNzJf7tbURQDjERlKG5hcPw8nCnlP0dvmLSlmQdsDt+4Hn7KhpZRSiwILOVj2OuAxkPOFyKQtuElWnstcJ3bxZRThT6x6LygGkg5rXQJcp6B5YjXSu6Gh/e2sb9vNekgaVjLMmfk9PmiUNG/jgHFe3GC5TsTLWzlHR50/uc9I/tAhBinu+sJtj1Jw4g6xr44BCWAH/F7A4KaJNYmy0F7Zgv1sxHfFjrsJ4KYR+GvpYiljxcA==
Received: from HK2APC01FT048.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4b) by
 HK2APC01HT051.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::399)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 16:49:16 +0000
Received: from OS0P286MB0274.JPNP286.PROD.OUTLOOK.COM (2a01:111:e400:7ebc::4c)
 by HK2APC01FT048.mail.protection.outlook.com
 (2a01:111:e400:7ebc::456) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.30 via Frontend
 Transport; Mon, 15 Mar 2021 16:49:16 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A8C68BA394741B313A92560361BBBC8D3DC3B9B9E94CDA57926138C78AA4B847;
 UpperCasedChecksum:52349238CBE38C29DFEA5E22A728F1AED681407FA010E02F6632DDA44424952F;
 SizeAsReceived:7308; Count:45
Received: from OS0P286MB0274.JPNP286.PROD.OUTLOOK.COM
 ([fe80::78ba:e579:d4f6:9d0c]) by OS0P286MB0274.JPNP286.PROD.OUTLOOK.COM
 ([fe80::78ba:e579:d4f6:9d0c%5]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 16:49:16 +0000
From: Xiaoliang Yu <yxl_22@outlook.com>
To: tiwai@suse.de
Subject: [PATCH v3] ALSA: hda/realtek: apply pin quirk for XiaomiNotebook Pro
Date: Tue, 16 Mar 2021 00:49:00 +0800
Message-ID: <OS0P286MB02749B9E13920E6899902CD8EE6C9@OS0P286MB0274.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [7a9GAgJk2n7UXwKCYgBXYkE/sM+KBbZc]
X-ClientProxiedBy: HK2PR04CA0072.apcprd04.prod.outlook.com
 (2603:1096:202:15::16) To OS0P286MB0274.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:ae::7)
X-Microsoft-Original-Message-ID: <20210315164900.54104-1-yxl_22@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (183.95.135.164) by
 HK2PR04CA0072.apcprd04.prod.outlook.com (2603:1096:202:15::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 16:49:15 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: fad1e91f-346a-4851-8aee-08d8e7d244f3
X-MS-Exchange-SLBlob-MailProps: CaK+F7me6Cli9Xi/SR1fLKgUuSyCan/HsSAv/TcpQZ36n5Tzzgic+iuKXNcfXxdilLRqG6/vyaLZdDst3kVJwIW35e4VIBca84Pk5rbYDtPa9v00vBAjSmeMLgnwVXW+MRIpZSrRpLPFbDzlBGt1Dud8n/3dMNdckX2qZ0eVUP7cXfR9bf8KyfDB8AsZCVgekb5ojcyFO+KgOlEgJAOrANVwApcPxTyhouu11rf2yuvB5WQ37xbcHJm+mp99dYiocoNUeAQyBBGcESZCP39mJTorlglY3Z37gUefF3ojKTGAxspPRLRQuFojiXslTqkqvzymJZ0T91CvQG0qhsiYOC394ZzcnS8M8OSEWAGx54jfZkeOe5fkL1gyREZORNLtnLhMUoL1jgQ6FZw78q3VfbwXvK6vZm7FQSb/hI20e2OVmOeXN/9A90LSywoCOoLyy+IkolP2H+1Xzw0DSHSqE0nb9ria4i2/mFPVT/mfKrDRBSgcGjwuTK0CJvuCXEVFVambKZtXZg5prrhBL6nRi8JEba2Aio81eNbpOlsAv6yjH2CdT7rOQmlC2d+eJQ5AzL2W8b0mUNbbXiYxQCKvmIsDiGuTEOcd42uHMXZjzIk4noxqThxxKwJ2pKMX2DQC8bHyB1LN1dPK5zOa2WGYitBDJcmv7RDZHn72tjtl2CP+mUo+oEAf9rCGmEIf2AlnQ+rbaDFd7xWtEf+zp4zqMlH5kqDKj2EenL4iASyVgMTscmKao76pqA==
X-MS-TrafficTypeDiagnostic: HK2APC01HT051:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tu0uowI05GwBxFowmPu7gv+Av1OxhbSetXbNdbrXKBDBIW4dNJsKruazTyR1HhQf9TKR64zGQKgeebisegr3YmkMVOHvMZwihQYCx4XfPX/3kWOUn5eP221tO8Hn2TMr4H7pYon/+n4qdt2z4UX0XUnj0eyeLNRZMy9arLAHxlGrDmYwmOHRXSIorUSclrXF9OUXFeBQCGZQMOthjVJDNGDT71s1+A9J0KPZ41XRuYFD01sV8XvEpdee10x+aU09ySp5SVKyqGZWqKynT17+OtA37kA+64WunXbkbMPTkO1mU1tCDPMoFbVZWRh2NAsI7HPIeQRoHeflZZniweaCF9ymys1Dxmwce7hhQLxcW5InB02kopUNK6E8tgSxBdimcj4SuoFOSBY5Wh84ot/rXQ==
X-MS-Exchange-AntiSpam-MessageData: FmOz3lSzmgcUyzBZSBJ9CMYKzsn/z8n0w2qzCdJSu2e55EBSqCPGm2xHMSERJW0WlAN9xRZ3uacPwRTwOb+oe07NE1nYEbxMc7QO6K69/natOIrv3tgwXiazHcVke0IgZtoOSTT164C55z7aNJlZDw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad1e91f-346a-4851-8aee-08d8e7d244f3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 16:49:16.0657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT048.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT051
X-Mailman-Approved-At: Mon, 15 Mar 2021 17:51:49 +0100
Cc: alsa-devel@alsa-project.org, Xiaoliang Yu <yxl_22@outlook.com>
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

Built-in microphone and combojack on Xiaomi Notebook Pro (1d72:1701) needs
to be fixed, the existing quirk for Dell works well on that machine.

Signed-off-by: Xiaoliang Yu <yxl_22@outlook.com>
---
Changes in V3:
 - Sort the added entry in its PCI SSID order.
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5fea2b999afc..18646694ff51 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8249,6 +8249,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1b35, 0x1237, "CZC L101", ALC269_FIXUP_CZC_L101),
 	SND_PCI_QUIRK(0x1b7d, 0xa831, "Ordissimo EVE2 ", ALC269VB_FIXUP_ORDISSIMO_EVE2), /* Also known as Malata PC-B1303 */
 	SND_PCI_QUIRK(0x1d72, 0x1602, "RedmiBook", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1d72, 0x1701, "XiaomiNotebook Pro", ALC298_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
-- 
2.30.2

