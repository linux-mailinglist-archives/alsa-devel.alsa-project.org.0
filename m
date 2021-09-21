Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 166D9413431
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 15:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EBA482E;
	Tue, 21 Sep 2021 15:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EBA482E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632231137;
	bh=EByeWfexctlvhK15c56edQkiGfD76nVwEuUjEWrrDyw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bh4CFxWv0jrtjtTWH5qfgcRriUtE+hQ+A+qXhCcLrxvs4ANNAtrJinacMbdeuKrgh
	 jFN7NpeP8E4D8geQdmoSP97REdF1KpkYsDXaOI03kSTC//ZsG3xVe3NWe8WgbA1xR/
	 jilri+yFtx1ZY8HSkx1ssWhU9v7mMdi5nUyQGOuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 264FDF80124;
	Tue, 21 Sep 2021 15:31:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E020BF80268; Tue, 21 Sep 2021 15:30:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2117.outbound.protection.outlook.com [40.107.21.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE1C2F80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 15:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE1C2F80124
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=axentia.se header.i=@axentia.se header.b="P++r4AoT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0trx4Ipp9tLQR7LtXfTYyS9arlKf38AFhtlPp6mdo6oZ3VFjomT2xQ5BGUFgIotYYOb8QP6yvx5k6+nK7v100pW5Df3bP2/hNf/2VysC1RHc+6nYaCEcSnz/+A8DN/0zhY3vuwuuxf5IpRnKKCFUpVJoVMMteyBA/wyc9CKVo1CX4NRbRO7KcZgXeO4nAThj/xqa3A63ZOzAmLd/Su6lgg8MSafkltF77iQnUvG5GoZxLGatxZn90XvRbpXxJmtl+cI5PMa69GjWpgtdyeAShkxLTAIXsD3etKL1iS575O/+deNDKvw6JSv6mmRpm6oergYgcxYHUTfcJ43bwQm3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7AbaU5KyMJCj8kjda7mS7RfosvTUaTpAFJc8YAqCQQc=;
 b=n0I/3qsrwO8fgOMxjHF9u4z4LVjGafnaog1MdQXHVE67fF7EGqvK2d/nroNZ4+FN7QsMNDf2OhnrecufGEAV1trrhXKlUFtOQNXUxMEXH2uqcZB7mhSB4ESQsssv93VPaQ7NaKIf9FI3hbrwQoDSsWos1o8dBleSj/KBTt8cnvt6XXNVe6Sg8yHiN43WdYfoX4QIlBPsGMmV09AYnNRQLUzyYqJfb6RvVm6NW1oOuIGEzEx5YFZXR3Il6qjGsy6YaMpNt0zbfhz82W+zCnODiSCZSeCrSPKm3rn3HitxE8Av9N4+8couqPkIlsChvg51FN04cJHbfK5sDmfhhIx9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AbaU5KyMJCj8kjda7mS7RfosvTUaTpAFJc8YAqCQQc=;
 b=P++r4AoTq01P8BJUteoZwO4hdP9lF4sfRtA4vfcQ5o66ZZGbjNA1niKhtpyieHIQC2+ElMFkZ6AKDmX5yBQ6G1ue4KZJCD3nWlkW13lfMaMcoiGnw2AEiNkmvOu1I9iFtBU2v02gA9eDQ8XqzaoG3tHXFV6l6YCUfmUmv02ah00=
Authentication-Results: birdec.com; dkim=none (message not signed)
 header.d=none;birdec.com; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5962.eurprd02.prod.outlook.com (2603:10a6:10:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 13:30:33 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a%4]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 13:30:33 +0000
Subject: Re: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2
 registers
To: Mark Brown <broonie@kernel.org>
References: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
 <ae4b25f1-2b2c-d937-e23d-0f7d23bdf0c4@gmail.com>
 <815cbba4-60d6-8d97-c483-146c2f7c3912@axentia.se>
 <7537b141-0ef1-fb44-7e02-27b4dd1e772b@gmail.com>
 <d9850534-df41-a6b3-48e2-34823f5866e9@axentia.se>
 <27f903d9-a74e-182e-b715-4124cf666f45@axentia.se>
 <8b96eb7b-8829-443f-481c-ab1772ece098@axentia.se>
 <20210921120113.GA9990@sirena.org.uk>
From: Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <cc8d7cfb-a9ad-7881-6962-77a00118c85d@axentia.se>
Date: Tue, 21 Sep 2021 15:30:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210921120113.GA9990@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0101.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::16) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (185.178.140.238) by
 AS8PR04CA0101.eurprd04.prod.outlook.com (2603:10a6:20b:31e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Tue, 21 Sep 2021 13:30:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 654b5bce-975c-40c6-c15b-08d97d03fd28
X-MS-TrafficTypeDiagnostic: DB8PR02MB5962:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5962D5D45F7B9D489230906CBCA19@DB8PR02MB5962.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nojvZ+uIBGDNE3XGz+FBFrg6fFMcq1V/UZQRgl2osDedcBHqbM26g1twDlPZlekRNfr1ZSoxOnrqyBZE47Yw51oPeXtxWPrC/tcF+dneODZiEK0sEGrZ2IcZZSbLK06EMtkCilmis23IgmrAXaZg5f3tdvjqUvjBuMLD+oBVKinjfeXy2sT2X2aOTNG+ujXcgAuGkceFLiVRTWSo/oG8JytarothWHc0/lWPO4rT5b5h8J13Met17+zgd5yOBmPgUG71pktfS99pd0XwV9ZnzsTNE/LhKVznINCGXx/E5/jtDrXTcNbExe7k5IchB1Dca2lGNl/7csqQSBotEwqgIWuqowaBz2WjekZ9v/0Fpe49Nlb8gZzQ7OCiDmV0RZ7hSUSoTMKzehW/P+vVyPn7wLCB9BY20hbB16rhocb6RP4FCp/N4f750cIKgajXYW6DjT63Nv8CRcYz/ibY/RSTuuA8KG0poStIv69i1xHMpfra2swt9te6L6jH6moM/wvzCT6a66GQwGXPMIES3j6ORVCNxun0rUgX5dXhd8pjVdqPiYAHMYRlduMD6HCpER4CXeaotXkzTsrrA0dJYsPY+JqDjtifmra+DcZs3XHYfNdPbveWv/j/7Z8XnX3D43BT2CZzeaQTVqZ/dpDoOJqq3t4biWFKkhGvZScAmYBjoiLltlK1GY2n0jvdP119nHIjWCeCOWud5I3VbeRe2fpgzkZHrWIlB0FSOJzeeU03HCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(396003)(136003)(376002)(366004)(53546011)(508600001)(26005)(316002)(2616005)(8676002)(8936002)(66476007)(66556008)(4326008)(4744005)(186003)(54906003)(83380400001)(5660300002)(31686004)(36756003)(66574015)(38100700002)(86362001)(6916009)(2906002)(16576012)(956004)(6486002)(36916002)(31696002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?Hn2jlQMyr8w4PK+1bYmT1tZUPeLQp8pIEeJZ2f3CsBMoDHaSSgUdnzE6?=
 =?Windows-1252?Q?ocbaXG5NkEotaUe8TUJGX8A8FTCCWmlGzS3rnr/DN0AIPZb3GK5dy/N+?=
 =?Windows-1252?Q?qEiGXgKlfXNfF+uEipyTzIt1b/ZrpaZjmEsH46ykj0q6VZN1oJDzunpZ?=
 =?Windows-1252?Q?xSDDL2eu9XjUL7koDCRxzSJzrHtIiQk4l8uSEJLG+rBy2ZsZusLpkL70?=
 =?Windows-1252?Q?m4eOijPYEMyK7EJ/1tICa+I6oXbsZk1nsSw+J+IT0b6A9M11A50juM7Q?=
 =?Windows-1252?Q?BDWJph1Fh1nmmRBEQ2iyKNv8zcHlgyj1fAM+1rrM07y4Pzu8274s0fDn?=
 =?Windows-1252?Q?tQMrY6oKcwOhEyZbhDiYK3o5TxG/16aSt6FyoTWR3LYl9ILZr/8AE5Oe?=
 =?Windows-1252?Q?GbXWFihVrsVQCXZ5lxBeJpnzRLX0wSxvk1sXtJUWnfaL1+tO5T+PYOw1?=
 =?Windows-1252?Q?91piRRdUdYztf+Kr7J7nP7F5X7RYiImRD35SAHvm2843TiUVIPQ/biWI?=
 =?Windows-1252?Q?WX3ZJN5gCWL9yG1grIjkSOIu6wKVqV0yXEOtsqY0kFA1Q+xAzT/m8Wuo?=
 =?Windows-1252?Q?HpbeKC7T7zCyIvcWrsDlnW+A65l5Qbf+LAZzV8Ddi33PbU3FqutIeXLT?=
 =?Windows-1252?Q?CRBpLfbK92SGPYbK/cEw+uUByxzOl1dzxTRC8fUTL9I4isQLQzc9rY/e?=
 =?Windows-1252?Q?xwqXElhdqfpbXCzdEWEGSNrhfMvG7ROXE80HsvNTUIk2WtAsrIge5dq6?=
 =?Windows-1252?Q?h9xdNLYJS5viwB0P8/DrqX92FgqrO3hZ4UhUQOUsnXxtdQB6XVuVv7QA?=
 =?Windows-1252?Q?5c9MQ+xNIRJsNz9WVgl0qmdAo27bSHwmfc62fY/2c2k8aEVCoYA2ogY9?=
 =?Windows-1252?Q?H4y7BzabVwJDN+3wPglyfIx9lEOHU08EaqvE1+aU78mBejcd/00Dn2sW?=
 =?Windows-1252?Q?Uo2AmV8dPU+iQXaWrn+IObcpmUKuCFSK1IB+KrqPqf6XHbX4kKZH7GUT?=
 =?Windows-1252?Q?QnBCP822m4GgfIhKhZjTFQ29EtB+zzOG1F6fc0sRMyw7Tb8EgW9XXrnk?=
 =?Windows-1252?Q?LVNsxb9MmnJ1hAq6aVPeF9Fe7MUALIJ7sCFcTlgkU7F/PMaSm96EQ4BS?=
 =?Windows-1252?Q?aKZfkc94XVyL/wwbJwYR4iJFZZbPzAeJNvIOF2GUsiqj49uVdpOvcDsq?=
 =?Windows-1252?Q?h1Dq8CMGBnwWirPxam7/bpUzg64wgoGhjHkcp3ibEgFhE3Elxs/BpXK2?=
 =?Windows-1252?Q?IX7weB2PW0joDwv9o/YEIpbB0630zxhO+bwe/GJfJWpVXqfGh/4/qL+8?=
 =?Windows-1252?Q?6IdJrjTRlyzORaBQ+N7KtELGmB5RyhObhe3flCnXZ+FcGctAD9JsCJ7h?=
 =?Windows-1252?Q?rFKaZ8+OGdZwvykMw0sc+r3er67/8nRsvqzM1Lnft0slPisGVmZFE2gr?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 654b5bce-975c-40c6-c15b-08d97d03fd28
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 13:30:33.6725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jFV+TGZsAGeKWeoxhHrtqgnBL7IXQ9V4b8egaRYpR4iLIRps0xzkrZEla8maq1I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5962
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirill Marinushkin <kmarinushkin@birdec.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
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

On 2021-09-21 14:01, Mark Brown wrote:
> On Tue, Sep 21, 2021 at 10:48:01AM +0200, Peter Rosin wrote:
>> On 2021-09-21 10:10, Peter Rosin wrote:
> 
>> Ok, so the attached works for me as well. But I don't know if it's
>> appropriate to resume/suspend like that?
> 
>> is:
>>
>> pcm512x 0-004c: Failed to set data format: -16
>>
>> The root cause is that the chip is in Powerdown mode when
>> pcm512x_set_fmt runs. So, bring the chip out of suspend for
>> the update of the format.
> 
> How would this work if the device looses power while in suspend (eg, due
> to the regulators being software controllable)?  If the data isn't being
> stored in the cache then it'll need to be stored somewhere else and
> restored on resume.

Right. Scratch v2. I'd go with the original patch. We have verified
that the original content of the I2S_1 register is the expected 0x02
(at least on one pcm5142) and besides, the four RSV bits are probably
don't care anyway.

Péter might have a different opinion?

Cheers,
Peter
