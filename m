Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 426122A1C63
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Nov 2020 07:01:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AACC5169E;
	Sun,  1 Nov 2020 07:01:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AACC5169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604210515;
	bh=uhrLn1Yhkuw3+8BBk2Ptr1eSCFfzEWV6CGsfxzrfy3Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WOzh7NKyfnzC5v/pHo/GNn5w9UM/l3R+Di4hDxPHmxcN0ER5FQlRpCG2TxiNwdJP5
	 u5mk+eYRQVjN9fsmf7htvGxCFrAjiuEqWDgHh4PV9LYqMGkdLASdue4Rtct58UxzlA
	 su6ZyfW6CIcn6CSfNeZ1aseK4CqVG1mTY0g3Nj8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A128F80171;
	Sun,  1 Nov 2020 07:00:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F45BF8015F; Sun,  1 Nov 2020 07:00:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO, MSGID_FROM_MTA_HEADER, NICE_REPLY_A, PRX_BODY_78,
 SPF_HELO_PASS, SPF_NONE autolearn=disabled version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::61a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 687B4F80158
 for <alsa-devel@alsa-project.org>; Sun,  1 Nov 2020 07:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687B4F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="sCZ1cCfl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFSOzrgn+8Znm4P7QRhSKs89A6Ia66hVVMZX7AOPaGP7zVVDeP9ajyPoUsNAZX0TZzJsY4C0Zftdd40NDJuXOtoE+e0NbwoZFiqcjb0SuLgsxtPaOZh5Fxc8S/sxjDnMver+C8C8EtoSETrn9tQSoO7QefomGMOCTPwu2DOBIp6fhgszo8UaYK5smDwDfpIznTdIvUj5IviMSggoXYb8Wq4d5CjX7TZWDgRoMisTMLYyfoSqwE5Ogo9EyHI5LcT1JW+m334x/FLGPGUSzSGMQuhqyJNUzK1HQ5pgMaIZsM4NYgKjXqtgS06c9eJ92ph5GxvUfFikSImGhV9T2M18VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+I7QgzOTAT9x1DEBYVgmetxqxrP/tQWYy7vgmRAkyo=;
 b=Bg+ezylFA6RgXVOklMSCmTcmn19l2wNHFqiLaHdEUJL2C5FM93X+RrmuWXo8+P13rZN/kocA1Sk1oZ2TYC11mpLpNcGaoNSY7pSBWDDRaRs6VeYoBL6wBVSoc1KekdaKRrzfiKWUQ/lUSWP0QEDpYgyjb95XgCuXK98cGJ9Fuwitsq4c8dlQIHinUyeuqbs2d4DLo7fo7Q0MBQ8Y2qrV6WvW7CTJkzfwxZlrn74UlQFmIzeDpLojFUIgQ2wRQfp+YRhXFJi6AND8vHuJl55LsbZnskNvKu5p4Iycow2DDebn8V0CP6NKQ98o1zcK8Q/jitb2s68qZTa2mdrSfOZyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+I7QgzOTAT9x1DEBYVgmetxqxrP/tQWYy7vgmRAkyo=;
 b=sCZ1cCflNpuPhmL3MWP08patZ1tYmqLeHw4d6a3BIcZ+F210aanxPZEYIv01/9Ea/0dfD0ULXeyj5tYvOCYtC97STJ0u+Skx5t6ASIzgO0jgGIme00TVRRZCYr0wft8GYvZM/o9VPFTwPMSFLWQkzy4XMcFzRDpBSDW3JZMMnvQ=
Authentication-Results: nuvoton.com; dkim=none (message not signed)
 header.d=none;nuvoton.com; dmarc=none action=none header.from=nuvoton.com;
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com (2603:1096:203:44::11)
 by HK0PR03MB4964.apcprd03.prod.outlook.com (2603:1096:203:bd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10; Sun, 1 Nov
 2020 05:59:55 +0000
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::7c3e:ca32:232f:ef71]) by HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::7c3e:ca32:232f:ef71%6]) with mapi id 15.20.3541.010; Sun, 1 Nov 2020
 05:59:55 +0000
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
To: Mark Brown <broonie@kernel.org>
References: <20201030050146.535983-1-CTLIN0@nuvoton.com>
 <20201030132548.GB4405@sirena.org.uk>
From: CTLIN0 <CTLIN0@nuvoton.com>
Message-ID: <8abcc921-26b9-5eff-103b-cfd292a67cde@nuvoton.com>
Date: Sun, 1 Nov 2020 13:59:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <20201030132548.GB4405@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [123.192.228.110]
X-ClientProxiedBy: HK2PR04CA0051.apcprd04.prod.outlook.com
 (2603:1096:202:14::19) To HK0PR03MB3154.apcprd03.prod.outlook.com
 (2603:1096:203:44::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.117.35.112] (123.192.228.110) by
 HK2PR04CA0051.apcprd04.prod.outlook.com (2603:1096:202:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Sun, 1 Nov 2020 05:59:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9425a255-9b6c-4474-b77e-08d87e2b5a9d
X-MS-TrafficTypeDiagnostic: HK0PR03MB4964:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR03MB4964CDB95B6E0198CD6F4FA98E130@HK0PR03MB4964.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ci5mMcl7wqjrKhG/KkFf5XkGadhc2foBCP3BpvhWVCUP2D/o70yN1x5SYZyByRdb4EAc0kGZ5vEc/5mcAw9SOhrI4ALEbUAJD7OlZ5zDCuLottFW7/FQPTZAY+0BFHCUJw3X96kvHYxNP5Q3yxxV49Mm0lH942HtHVTMyMB5TeqaEfplgPRARglWJCeBpg9Pf02nE3DAS5BWs5vRe4WEj1tfhb3IvSXfPOLS9p5NC/QZ+CltJbaAm2H6+xnww7QP0qzqvk01SrQ74E/7mDxq7A7Agq2nowR952HXVg3qfO1p0M1WMjVDhVy9UDFK5v1fiETn82Zn7SP99LpLoTJIUK6mt/QbK+JDC3Pp4vpRCf4YsvNzmlCDRgZugY+f2MSh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3154.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(52116002)(6916009)(83380400001)(4326008)(107886003)(2906002)(86362001)(2616005)(8936002)(956004)(31686004)(6486002)(8676002)(478600001)(16576012)(31696002)(316002)(66946007)(66556008)(66476007)(36756003)(186003)(16526019)(26005)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5iCRSdaCIHcf9t7UNSUwpYMk8HnHzF6XwxA9olHKKvps4svxc6NsuWY5M61KRJqJUMzxQsDVQ+zedB3pzR9xtrYyqU7pXO3c3GUBbzgNlrbbeLpipjWQjmSP8DYCACCUaRRP0Vf4t0tewGMiMQUX1BAKXwZSLZAIAh3rSFHtyCBZDtaMQrFB7owU/mgED8wEUKNxhwH2DhIUnfC8oU1T2baJ6wW1+Sgk+Nr0YV1DzXLE1GwBBv9oH3mXTTrqnfQrjNFlHqlK6OZnyIYRs+MCoAkKSgmkiZrE7qpX7JtiKYINu+DfQ6a3NJLQgwd/c61G1brJfwFd+zsd/NpuiWRqvXB0t995WoONzS9mRgDGElRjZhhP8/H2SXB6IgTs3GCKcyBr/N1UQwChZcjGVjb+qcTzQq9f7LkJPLvi+XcwSGgynKVNRlZLFbgZtPjnDA9JGGRNfjjb6Pgg//ASNHJWpVMHgWJDsgYPVWUREiR0mf5kRc9Gd1wKEp99atysn6PUcXUi2U1+PC80nJTynToBxen1veeH5j2CinGpr/9SOe8fHWjqNM0tQMe+2AZHolVoJtUV6Oa/PGsJWtkir4YOLvleckCDYJvqfEaBjVlRQiqJajz8udLa8gPFel2lB9LJS7J2qhdL32aIW1pw8KpNsQ==
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9425a255-9b6c-4474-b77e-08d87e2b5a9d
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3154.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2020 05:59:55.0599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3K3kPqoRXnuuK+wuJ+5d6gULSSCyVM4IPPlRd/xM1QUmtm6bXbx5DV5t7DSHM4INbvEMChLgaAg47o6u9E/aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4964
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

On 2020/10/30 =E4=B8=8B=E5=8D=88 09:25, Mark Brown wrote:
> On Fri, Oct 30, 2020 at 01:01:48PM +0800, David Lin wrote:
>> Add codec driver for Nuvoton NAU8315.
> This has still got issues - it looks like all the tabs in the patch have
> been replaced by spaces, that's going to make it impossible for any of
> the tools to handle.  I'm not sure how your colleagues handled this,
> another approach some people use is to send from a non-work account and
> bypass all the issues with corporate mail servers :/
After checking with the administrator of mail server, he think it might
be the related setting not transfer to new IP due to office relocation
recent.

I am sorry to have confused you. I will resend after the setting of mail
server is ready.

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
