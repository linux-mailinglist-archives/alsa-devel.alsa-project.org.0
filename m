Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C17AD4AC6B6
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 18:05:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59D4B17F8;
	Mon,  7 Feb 2022 18:04:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59D4B17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644253511;
	bh=iIS7/t94QyOWCwSr2OT6wkdGYB4H4xN3+F2J3Eh9OFY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uQZZZb4HAZMOJNsEgrlJ3kEzzSJcFV6+OONDU8PV4FYLFeyvinFT4eZfT0hgQCSJE
	 3J1Qk9Ve1yVP0o7Vg59h1A3MW59nTt9pZeWHR2h4ck8AYA0FwekNw3nYONfLmW3o5v
	 8AHITl8CbcNzF3u+Zsghr9DgjA5vlZ4BXqv9ExC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8251F8023B;
	Mon,  7 Feb 2022 18:04:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B602F800E1; Mon,  7 Feb 2022 18:04:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:4023::701])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2241F800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 18:03:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2241F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="hIyF/h5N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvG2Eeqw5y9yplG8Yr6wJ9Pg/+q8miqi4QrPv4xo2O4D2x9VFZRgWHQn7FsR3/i63DNDiydQU/7VF0w+/gSSnVFdfx13bxjjkx3Ag2hoDbpz1bQspM+KHs72VbXNP9Fa41Nmn0mGd0XeXUHtulD0WutpeFbuLDjr/orUw8wUzCaraNWsJyZxmkc0xMNbaqPtdd0evrR04I3JsapptQM2hRWZDhcX/1A0OWtFbVEuzj4g7Uo38cuWi9cXNzg1HzY/loVKkmIXgp4E7jvYlF8vcoXorG46Vskt9NWSkgbi0L/SO3XMiqjXe//9PeTBU0EkSrtmOH5Iq4yEIT8JwuAbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUMj3mCTCoF5ErCjyxWtfJLf11TdEXFuACUOurOAy2I=;
 b=ackxB7XQFl+emuyVr9tFoYnszHhh145B8PMUt0HV1/LOvvLPZPEcb3/vKNg62kTN8LfbpXG1i9YHbOKGB1cZExlTLsyRhKjlfqER8RrBOVMU3rYsXO0au2j3imZWswbEhKDSaCaBxkFc90VNr+XZRphsxv5/ia0ishqpkZBJ13OHYRmwF67DfWz6UaK3zOrlWKLpFCqmPjIRkzsFxRnbKBWikqrrzdDZrUr4g41Nm6cktQ0UNYTTMmyk6YYdVHDJ5O1ABDSs3ckt/eSEwgo1Uhm4x6o+QTCNB63d11pSoa+qhSNN1HHyggoI1kQjo6ygR8zvm7zQ1ca/qBtZIxFO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUMj3mCTCoF5ErCjyxWtfJLf11TdEXFuACUOurOAy2I=;
 b=hIyF/h5NtOeW2sioLMcFiEA2q4JqUrMBOmgs34J05+TN9Z0n3bWUdBSK/lBb30upnSuMYAcEH5tQkke9cSPWQQQZoRQlOCm1hiQwuazhcPjKVpprIRpEwXVSBfIppaKQy3AMR3g2mikxrpey7c36sV04PZWE3l53sfSyyQXzgqo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3d::11)
 by ZR0P278MB0715.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:26::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 17:03:53 +0000
Received: from ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c4e:9890:b0f5:6abb]) by ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c4e:9890:b0f5:6abb%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 17:03:53 +0000
Date: Mon, 7 Feb 2022 18:03:51 +0100
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1] ASoC: nau8822: export right speaker inversion
Message-ID: <20220207170351.GA1217637@francesco-nb.int.toradex.com>
References: <20220207153229.1285574-1-francesco.dolcini@toradex.com>
 <YgFClQRVX5cX6L3J@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgFClQRVX5cX6L3J@sirena.org.uk>
X-ClientProxiedBy: GV0P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:28::9) To ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:3d::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53c8207b-cc58-43b4-f376-08d9ea5bd19b
X-MS-TrafficTypeDiagnostic: ZR0P278MB0715:EE_
X-Microsoft-Antispam-PRVS: <ZR0P278MB0715415C914B52367CC2AD60E22C9@ZR0P278MB0715.CHEP278.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PWn1jlKqEKTeJe7Iew/8vKKfHl9h9VkQQaM9WNn3Q0gw+nM65sWJN1qapwYPfwlSkmMvzv60xWsT7gVnMf4mJQ5fDUI8N7ftFPwwnfX+s8dyeQKzfqRAwFLwcaVnM/oaMFrrLQTlr+1TecAIusxHPhpPbN7v0tAvwZbyg7Wxiu2Khv7pGdgc8+hZBth53w3BudFTtbB8ZWH6V54KB6UO53RovZOsTSnJ4tKqV7s+7bVF0vfwxL2pS4ltgkwZSorAFdzP9nLyqJBtVvhC0rFdiiPH6uqenT6HlkxTWtemipWXzLv1OZpeBqO3I4s9oTHeqiIWsqfftZsR81znZYa93rARMudZBFGVITpf/4nKfEhcSrpaFupfBxLN1e+hFJi3OZK2/eGpU398YchBdsOnGl8C/yIvLqpFAZnRW1MxgpaUA6rnyc9ghOZ9DhJA1HgPxDDH6z6fZu1vJa7QpGt1RsrHTFkj52Q/NuAKNPRuiNIfLJ2aFOnxdI02IpB6oafh78VUbPBq7OQho5N6+3XqjYrM4W6RlfbdPfp+/cMNL0gA2JV3tXGE/+B6mc328k7um74P1bzwfvKA2xaPOvtA7JpUAbfrAHB0lMVRr6vneIxezUwMdeERCFRAzVQSCWoV+leEp7II1fLwrNL7kRoixMphdRXv1A8vJcMqfHQmY3jWLUsAzxpgOvgG4f4gknrIX+c4HLp0j6WaIYSZODl+kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(39850400004)(136003)(346002)(396003)(366004)(376002)(316002)(2906002)(66556008)(6916009)(6486002)(38100700002)(54906003)(38350700002)(4744005)(86362001)(4326008)(44832011)(5660300002)(66946007)(8936002)(33656002)(8676002)(6512007)(1076003)(6506007)(52116002)(26005)(186003)(66476007)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F1Ns2FypjnZnPIN0Xt2qvzxl+tPj0y2aFLcL47KzTnVW5i17J513m0rZfj83?=
 =?us-ascii?Q?7l0DGKXcOtnqVFacenXRlgaPI3ukVczeppjMEtNlOIw4qbz6uWNmjQqStwNW?=
 =?us-ascii?Q?Ocm8R1+RuGpyTiqt04EqOwZ1XqnGPbCIsBJUZQqaa2RfxqS3KVViyVOVSb4M?=
 =?us-ascii?Q?RuNIzXuIoagUkQi4AF8U8+nHqxlPt0YShGlZGzbhn47y+ZDMoRWNldqAGo/5?=
 =?us-ascii?Q?jrxHXo/8Om6cyJ6N1oV3w/r50ov34PMUUTC6g4Zi6QSg+iX7A7CJ0Rsio7kC?=
 =?us-ascii?Q?biMu7ydr9BhBUBAnjRccfjfhtku4ieqNnmduEa4oWmlVxN6Degly+uauLtfj?=
 =?us-ascii?Q?kmU+lg4a9pYfcfcn70IrlCB0qoB6cQSba5OZTk1wCo2QCC9lbB/XrwDmCrLE?=
 =?us-ascii?Q?D19UETviaK8IgqG6mLx3fU37jEZRUkYiZ5EHBojqJbGA0j84RWAKMTiyyuF/?=
 =?us-ascii?Q?9GMuqNOiPsCWUb5coRt93RQwRuXOOCmyN2d9aLViVIJBunrNKH0kAi9J6PyU?=
 =?us-ascii?Q?I+CYkKukaL/dj0Wj1C6r7qBU5NuWjCv6jb1PJCoGxmHniDiCkFw2iuYAYr6i?=
 =?us-ascii?Q?Bs6ti7RUjzzUk0/isrF26K0R/h4J15gthxGefh9sUfMlRWhWlG9mtyFTdbaJ?=
 =?us-ascii?Q?S34b9usboovytdVE87OvxJYM+BRkIXqmHiWlPCkzwVRFLlKXInlQS2TK60ft?=
 =?us-ascii?Q?6/lXpEGrFCG4uQUWxc997d+0aEP+7O+1p5bDe7dQyUldU7kP0Qf3wZSkzlmh?=
 =?us-ascii?Q?LGFcdAwPbMzvSHpl3h91ymch4pUpKnGZZa3RTqq0t20ay8RIn4FBUmczf5wF?=
 =?us-ascii?Q?ckEtwaKNPLVmT3+ion9oGfOya1ybkB9AScE4xnwlY10mjfje649KqqbQLPPW?=
 =?us-ascii?Q?boCbHniYs/QVIlYziZlLnoKy4mnJNZUawqrZqRwCFCjlNwnHg/zI2T192nu+?=
 =?us-ascii?Q?uPNJ/Mh+YBJ5WI3PwSCeTvjDk7cNh3BRUm2BnvFrMZsMCl0seUKoejmYXjIa?=
 =?us-ascii?Q?Xyt5y5UvufGl/d8dR+gow3WQRf6nNvPp5lOqL67H6pEBVM1YkJUSGL4gG5Ex?=
 =?us-ascii?Q?0Zdila/4leck7xIijJKuU+0J8bQ0dXZqUaIF/bxZeLj4KAYkFxgOF6+tdJMS?=
 =?us-ascii?Q?h6ggLkCV0wZClODZojqH8rqet1OLqa9lVIKG9jDvWvtzMb6bYpWAa2Y7js2A?=
 =?us-ascii?Q?TEt73/0W4G7tPDEVSfMBBy6jwOUGyc4rduPYkJ8WQZtpg+wi0XNEPg2GGfpP?=
 =?us-ascii?Q?B/KHY5N9L+9O/A/OuSgRch5PJ+tnUxuXjb90HspiaE/lsvGHgPEP1mfPlL1b?=
 =?us-ascii?Q?KzJCvHwE3C+9vNFBXgrSlq8I2YXjSFQEzAeU9c2bZvqqFpcZGXUN8xvtk4PX?=
 =?us-ascii?Q?R/VL/hQYhWk4MaBWJkWR4Pb245LPAkQgLnRIwYyd77wFMUNLQXCjFBS5UMTd?=
 =?us-ascii?Q?8bRP/aHnkOGbrbOTmDG2ywkxqFjFoFddYTO2ggJxNWcjSp5sbpP7uGwT7bnJ?=
 =?us-ascii?Q?fp8qKIGRf2/pT1VITN2xRowZxL7kvAOv7Ob3Efr/1LE5zIwTZz31MReo3Y7v?=
 =?us-ascii?Q?z/BpOBP9t7pjs1+RqeieUL3i3foMGi4Z4OkY684YgLvVPclo6zN5mrwfkMhh?=
 =?us-ascii?Q?rwRYGPbwWWBfIBBh6U/8Pb27jyYe5qvzSDU0lGD9xaeTYoSvJfbk8Ff+9XmV?=
 =?us-ascii?Q?CXwFWA=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c8207b-cc58-43b4-f376-08d9ea5bd19b
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 17:03:53.0155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZ+wLpQnntMpzrV99ko7+sv9OeYdWJYMmqq7ueQnE9/r+7h74Y9eH+3Xvv38ELSMNiPxWJzt0TZ+iSc6ikEovg6QFSV4k+ap8jT3IgJO6xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0715
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
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

Hello Mark,

On Mon, Feb 07, 2022 at 04:02:29PM +0000, Mark Brown wrote:
> On Mon, Feb 07, 2022 at 04:32:29PM +0100, Francesco Dolcini wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> > 
> > This control inverts the signal fed to the right amplifier.
> > This allows to connect one loudspeaker to the two speaker amplifiers
> > in a bridge-tied load configuration getting higher output power.
> 
> Is the value chosen for this not going to be a property of how the board
> is wired up, in which case it should be handled as a DT property rather
> than varied at runtime?

Not really, in our board we do have a L/R loudspeaker connector and the
end user either connects a mono speaker to the left and right channel
and enable this control to get more power out of it. Or you can just
connect a stereo speaker.

Enabling this control to me does not depend on the board.

Francesco

