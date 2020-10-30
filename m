Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2D329FCDC
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 06:02:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F43B15E4;
	Fri, 30 Oct 2020 06:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F43B15E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604034148;
	bh=nyfE3U0LUhPUXK21BTr3r9rvcih96BFnYmlixbmmJP4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GU8YY+hOGMDphFh0DfYJGkh8ToNdBfjNlnncStds3GxY3cFhizJiF2ZeCD/3/cpEh
	 boPHHET68/Qtf/ZpJlgP/tgICht2Ec8bcvDS90cLK+OuUbsEYfDE1cvO8QLqyBPrN8
	 xqTHhvRmeAAVHFDjGm06bP3j7DPEqvnsJnH/AaKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C20F80107;
	Fri, 30 Oct 2020 06:00:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31C59F80212; Fri, 30 Oct 2020 06:00:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_78,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300085.outbound.protection.outlook.com [40.107.130.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFEC4F80107
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 06:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFEC4F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="eunw2otk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aS5GkRs3vGtkoEhgZhMf4+SD0vzFqLF0KQER57RfVn/qR6yxMdN9d6o0a6hRqWNhfyFeKUwRJ3ofEy57Qcq+yQbmVW5ftXwr6zAVstc1CJJCbgvxd1JdjdEQEsYEFD9v0hJpBKCuqDmG/5FP/w8TUNZ8fMZYN1V02khuhnsX+poR9x91b+8RroX1g9/d8vlRibQ332eRD0F7JIgtzaW66xiIg8OWY3vtyU+1S6OCBzoAi9M/qTOwyM6gYKqkAWmEMfAMT2/eYdcN7e40fdz4nvX2tSoGKk9xJ8HBlChnuTXWZ1NO0uRKlun0kXIK/uyM/gKa0b4SR2xA35WGaokWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyfE3U0LUhPUXK21BTr3r9rvcih96BFnYmlixbmmJP4=;
 b=EG5dQDWvzXcn6SlKcOM9cznlwn6NIyMAJuuQv4GFM5xHAL5R8Rb0PQW7c/OsYPoVLU1sM6oVGAcvDLHh4yHv1bDyQ1yX/em9Qi425A1KrbEWX/ik57ACbpeQNkcz1SAvnPfE7Iz9npPrFVUbUJLFF1Atg9H6Wtd7wt6CKlcHKFUTZKQzyDaYi0sFbEwa2f+TLavZEXOugOffVx5oNOmEhW5DjaBHhWGBBg9Ww5c0yZx2vfZLnZOtlO5gfJR2eRurkcxWp/Tzm2HY5kQnBkJY9Rdv0adsmAZh1DpOiGP4KEArjPffGQtJ87Vqp4h8xrLQ0PemMLHNmmp2LM6+zlc2LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyfE3U0LUhPUXK21BTr3r9rvcih96BFnYmlixbmmJP4=;
 b=eunw2otkM/NG2GZf9f6h1HzCm854WeVvbFF3mlyegdIDGC2WKShdPpju6W+b4/9nL47hZ9UTp6tCjkeHIaiKwW2Acomk3DLJjIJoNVttvveSop6yrtRbTDiXiBnah+fdXwWMv8D2CQe5emBEE0KvuM7BzFH50aX64CQHCkgoFo0=
Authentication-Results: nuvoton.com; dkim=none (message not signed)
 header.d=none;nuvoton.com; dmarc=none action=none header.from=nuvoton.com;
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com (2603:1096:203:44::11)
 by HK0PR03MB3203.apcprd03.prod.outlook.com (2603:1096:203:41::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.4; Fri, 30 Oct
 2020 05:00:28 +0000
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::153b:ceba:7364:6263]) by HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::153b:ceba:7364:6263%3]) with mapi id 15.20.3499.028; Fri, 30 Oct 2020
 05:00:28 +0000
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
To: Mark Brown <broonie@kernel.org>
References: <20201029113311.495413-1-CTLIN0@nuvoton.com>
 <20201029124642.GA56515@sirena.org.uk>
From: CTLIN0 <CTLIN0@nuvoton.com>
Message-ID: <3273d5fe-7e07-549f-1217-d24264a2e937@nuvoton.com>
Date: Fri, 30 Oct 2020 13:00:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <20201029124642.GA56515@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [27.247.235.104]
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To HK0PR03MB3154.apcprd03.prod.outlook.com
 (2603:1096:203:44::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.43.101] (27.247.235.104) by
 HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.5 via Frontend Transport; Fri, 30 Oct 2020 05:00:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c310912d-b4f8-44fd-1480-08d87c90b7fb
X-MS-TrafficTypeDiagnostic: HK0PR03MB3203:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR03MB320371323441E2616A9827A48E150@HK0PR03MB3203.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: huBmwX4/35cYUIcAwsrS3VnmZg2lzbewAgkhxiY47xNMjSwyy8NJUgfhSbBIHMZiItWe9INJYwgmPQ3g1Z85JuLl/wqKimt7MLG3urMjURHf4kTRghxyYhIKtEVauezuHZqrv0s3sifdQcO+QQVxdBnlGdaNGHGt6ccT8XYJ5Lc3f6S+WqBydiTS5dZ6ItuFE5H7tzqpxJb1xZOp7ClIY6ALt8qdB+VTeGJePuQXI2eWHWBHZsvFhpxJV33Lr2IbJci8EqaqNGCMmBqLIwCe4ePmcf0QbWRANQQ927HkHdzFLB47C6hORKPkn/ipWQTjw+JU7hGilZSMqHVBx+JK4LZ1tbzxo9MwU6MCb6a+B3mBX4FY9m4BJQv64uHDmw4T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3154.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39850400004)(2906002)(5660300002)(316002)(478600001)(16576012)(83380400001)(31696002)(52116002)(36756003)(4326008)(26005)(31686004)(107886003)(16526019)(186003)(66946007)(8936002)(66476007)(956004)(66556008)(8676002)(6486002)(2616005)(86362001)(6916009)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: T2nAINkinQLUE0igLSVFzpaTUjEfhNe6rQeAEW+tVayneHEmDEAJVWX5q6sRIR8E6lPfQYx18QZSTHZbPCE6HAeO2+uSBsa94Bfe7nJRtcVizF8kTnb1ywYUgUqx2ddLN4wo2cTrGTRMumpfPhbXOkBqM2PEBInc+OfWkwQ2EMI5c0VU0X/dJaZKe5j49jJULiPZEd+2fmqMK2nXkHATkzS+mAzwTivdweR96z/5JGIpoEMxyL1NWdMxEfhUqvZkoEbV6Lsmap78ulGR9i+sLUN2WFTw2k467ZFFYZ1B1FxVMUSGMgSWrVKZmUYcMqzCvDa/tDEIW01toiAAd6BL3eKP1EhRGuL8p+Fv08ts2li9Q7qtk1loAIzBXStWzNfN0Ld01nEW8Huhf1MWZSjg5VHyZk2IzMna5en1Q77sGhChzfWeZYcJIVwsl6srOaE+iwzBpQm79w6qeG6B0soL5Rsftr6c2NADNuDZaPZk3Jmy2T5CqT6mm2mgffUv7/uWeWAz6asXtYIml7Rfkpwt1aMCuodZbE4SL7i+ZEjytp5caGGpLWmIffT7l7IO0NJtHqYBOsL8zyZHob1a+iBkI26mFtPxaRgFxzLjoPRBOTqyIwcrVZv2zIAQO6UB+OqQq3qX4HSmME+CU/Xp5dsxBQ==
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c310912d-b4f8-44fd-1480-08d87c90b7fb
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3154.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 05:00:27.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfcSCdKBZvD88+sE55GPAztZ4WhDfzsRei7LjsfVRjPP2y3d/Yu0gNheZYycb14qoTAEGDecgEXUF0JVUvYl/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3203
Cc: WTLI@nuvoton.com, YHCHuang@nuvoton.com, alsa-devel@alsa-project.org,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com
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

On 2020/10/29 =E4=B8=8B=E5=8D=88 08:46, Mark Brown wrote:
> On Thu, Oct 29, 2020 at 07:33:12PM +0800, David Lin wrote:
>> Add codec driver for Nuvoton NAU8315.
> This doesn't apply against current code, please check and resend:
>
> Applying: ASoC: nau8315: add codec driver
> Using index info to reconstruct a base tree...
> error: patch failed: sound/soc/codecs/Kconfig:130
> error: sound/soc/codecs/Kconfig: patch does not apply
> error: patch failed: sound/soc/codecs/Makefile:438
> error: sound/soc/codecs/Makefile: patch does not apply
> error: Did you hand edit your patch?
> It does not apply to blobs recorded in its index.
> Patch failed at 0002 ASoC: nau8315: add codec driver

Sorry. I feel a strange because of I can still git apply this patch to
the latest branch even I create a new branch track to for-next.

Anyway, I will resend. If it doesn't still apply, maybe I will confirm
with internal mail server whether the format is changed.

________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
