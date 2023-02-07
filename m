Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CECF068CB85
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 01:57:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A3CDF;
	Tue,  7 Feb 2023 01:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A3CDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675731472;
	bh=m33fwmJbxVVd8J3sBGMIIWUSTZvji/NdsmuHlMEaQxs=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X+Thc1J5kasFGEbQV5cthn2co2bm5r08jk/ENQvASDWO5MYoSFl5fWCIRFw8mnYE1
	 6kQ7LHoGra9+Zv9ulUrIMAx2s/tWsTvW59BIZ0bMj48XdIYJ8ZcVPF+OlvMbmzc/8d
	 2QM58MN7+cU0Uc1Z/FgOuCHw0Qn6e99MyFWYu6xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 620EEF800F5;
	Tue,  7 Feb 2023 01:56:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21713F804F1; Tue,  7 Feb 2023 01:56:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::720])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CBE9F800F5
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 01:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CBE9F800F5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Th9sNjnu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmNeVOL08zg0EMs8qp7XVmjS+DYgTEA9oFh4/0cVpLnun67w+7WJOS4GqT5bzGRE4Zt7iS7VeIGCblfbKx2Thn6OnF83xm18UdV8IduSWoVepLin7j0cNwwKcYB7ev56C6u3/vpHAMkA+/u/Cs5sWysWuenMPrwpnFoLb7VywUX+EMEMnttjOdk5A0/FbAU0e3CyLlEe/9QbQqm83z9BjkxuRu7gUpky0Y4p7uVNQgX577+wyk95mqJn21HdfaezhAtIqV7coqaoE5oWezIE0zysjDxnzwpcgaoKbvQxIM0RgCkhp7RO/n0G14Mtzh+CYLlCBNB0mdi/ZISX/F0EKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xm8t1yhM0HXHB4vIJWK7dYRKw8qTfsb9smkoKI+PZhg=;
 b=MZH2aJRS2RAAIqI284BRb4zj3aXrtE8JXhdYI0noJVsNw5Szzjg6D15jPik3fOAEhl5xegDjIwdwo0Y4p8yaCfDY4ueLcBRlbTCT0QC2Iw0dpWFbTtx4JalLdhDj1bXeJAa60UmkUJt3InIbMSfJo1glYq2W1ub/QngJiQKZTLIa0Ewyii56ScydDnb44ZEgjIVEL20XCNVbKUDY8FhtaGL+6QajoyedUEogZtulWQLWnNd7On66Z63JN3DJkeT16ixmIoDPmGcGgTbUFGfh+i13fyhG5OomYudlqpJRD1RaZtJSocmvFftBIBf7YZoGGGo92SVdiggu+1An6v1zpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm8t1yhM0HXHB4vIJWK7dYRKw8qTfsb9smkoKI+PZhg=;
 b=Th9sNjnuHm11mR9Y5Va1Aw41Qx8AvjvrkGsqLA4B4PiajXblOPBfPLF5d1YDqJZtn8cQjEXGHmwIT9IpE8A/HpkBaU71KaPlXdm7LkamVflOnZ+CW4R/vGokF0PplsSZdCALRvnHlAIl3pGtTnxRfoC5KPZl/J+tYWwdkjReCc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8545.jpnprd01.prod.outlook.com (2603:1096:604:18a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Tue, 7 Feb
 2023 00:56:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6064.035; Tue, 7 Feb 2023
 00:56:34 +0000
Message-ID: <87sffiuwce.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: adjust to R-Car Gen4
In-Reply-To: <CAMuHMdVFy62v8WC3H6f5NggTdJsk=2FmJqUR8L3XkT3jcKUj5A@mail.gmail.com>
References: <87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com>
 <46974ae7-5f7f-8fc1-4ea8-fe77b58f5bfb@linaro.org>
 <87k00vqzw2.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVFy62v8WC3H6f5NggTdJsk=2FmJqUR8L3XkT3jcKUj5A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 7 Feb 2023 00:56:34 +0000
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: adbeb913-6577-4dc3-fdef-08db08a628a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: virkCjSd8MtOfB/AYr6jneAFicCD8stPjq8hVnS0Yl2r1pACdOLIVw/onjxJjECHYqbUDGsBsle36KHYDJL/LB2190TQ73YgIfyqHVDhYhS/sZ3SOgiJZbV3IIEFnLVx9nUEzgpyoyx1arKkd3hKzNtNCbBTlPWqnhy2LjlR66Vul6cAV2vVNt3nnQBbMRD5WRfdYhe74uKMenhAmF90QNj+bGh+nIWuCS+MOq5sVGz/IZdfVU7ImM0UUJEMKzOcR2GZ/N7pNi7kuF2jRUVnHbuInE/AIyfEW8bHWel5feXWW4Nrw0pXSbs9L/Qxx12MZhlOdxdu+Df8C9X9PNjd/ptX8V3uFuOJuwlCO5eU9ynmT2nSfYelXBne4unKdjaYtDSdwnXr3KbB8Gse1DJHzvUwGHct5Aq8om9te2Eltelk9W8hKCkaHwa4EbxLqeFM02uhJxzqBSZH1gXunp//uso7NY5aSIKWpt1jwjoGyBcNbEiMT51HgbBpJL8H11HBv2Nr3ifxHHTKIcrxrmJRKvkK+zZwOWya93PwgDlTnaqaooSRMXV3wVncJn+o5SZr7RcaTUUVu+ZKALyanMJONAqKLBBeEEb7qD087W2eeGKVaUSl5vDhWYRTIVSqpqhxiuu0dGaTsqZoixlQu7vmWb6WyT65pqvFwwc6Fe8RSlFaJBRvQOR5w6pDluq7LiOnM5zFbCMGxm9lQYNGld/EDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199018)(36756003)(186003)(26005)(2616005)(6512007)(83380400001)(52116002)(6486002)(6506007)(478600001)(38100700002)(38350700002)(5660300002)(86362001)(41300700001)(8936002)(2906002)(316002)(66946007)(4326008)(66476007)(66556008)(8676002)(6916009)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PxObUYvMRx/dwfpfnEqk4BAtAk3g0sBMQJlIKhnxR+cXSKl9L87/F/wLNBLC?=
 =?us-ascii?Q?rUKsDh2we29qcBYlPf7opCORoUrbavJcA56lDYUJ0sjp14DpV5Cud4eM8zys?=
 =?us-ascii?Q?eJbOJ7wq/ZVJFVr9rznHJMRgZ+Xv/N6CNGLLMiVXB7GyxfTme07IR2NPd+8N?=
 =?us-ascii?Q?uvjH9Vy/ZHI3E0wIsQVNpq7g8ShNfT/qyNMuOdVXvkoTCR5TCAlxacdfWLM2?=
 =?us-ascii?Q?Md1PoaXJX6C8YYJXk1jR0W2bGGVJdZQZHB2h8r9vu+bg7xkA3pe/KhT7JuZQ?=
 =?us-ascii?Q?agU40NbxHPPrfCJcsPvDtvzyWFBLBmsPkoEhNF2tc0sajO2IYXSKGxwvJz92?=
 =?us-ascii?Q?q/5feNlHS+13ftPdVqAoS3U3dePlcX2GiYNI4B0MrifqBTzTKpls9W2wsZe8?=
 =?us-ascii?Q?Ib228bFBzkidIUSvkCQ/yervRBDjCpY1RhlFVyjYl2Uuzf9CCga53tSrR0JY?=
 =?us-ascii?Q?QCkGnMnrI4PfNtRSj4vry3BNGAHvd5H+RkliCnHW4rMpksIJN1OGflyHSPlo?=
 =?us-ascii?Q?v/sUJYHvnUpVTOtQp7TxtjJZHDZk7ryw5vgzuUy0AwwGYRcSC48lyxUDJX2y?=
 =?us-ascii?Q?MyBF2s/Hj4i3hHBhRo3BeWvVk+BZwdR3RXWk279yM4RoWpI17rCiAFPu7kNK?=
 =?us-ascii?Q?vzradKnlTZ5Tv5o7cADsgPK2EdOBn0bQHTvNpk2vm7ZV+HuhhcYsE0bnkJRc?=
 =?us-ascii?Q?4+t0kiVEW/h8I9DPCNwJOMN6cbmvuDbq9Tu6jJ0AUz8Zyxggjrm2LOhsXlpT?=
 =?us-ascii?Q?tjejk7k1k0x5gtaowLINcLDie+ImZ80BT1dcPBoruDtvFJEo24McBYsbNEYA?=
 =?us-ascii?Q?IZv7oUCGqH6fMqshD2Z7S2lgdEgVPErFy20C8uHHvcgcGYTktGMmHqyjLUgv?=
 =?us-ascii?Q?l7J6h/BuCyJuYHELoRhFFa6gDFhR/Ig3DqZoBk68GWQK7Gd1xJmvXlGt9+4c?=
 =?us-ascii?Q?sPt1mx1lALIjYLu75T4jKRzBrcpXv6o79Yr7TlrZMief7HZxa5kxFyfaIWvF?=
 =?us-ascii?Q?pBjJzcx6/ockNo7D2miivfsEOdZ/uI9ZfxtUCeuiAoA732gfbNfEMO7Mf/vT?=
 =?us-ascii?Q?TUKbrMviXWmbdpykFZwRzxMzN0L/ZcPlUSploEq5FBEoKHufeDuS4xObOrr0?=
 =?us-ascii?Q?2LcVzwPCRlBG1zvUQRkDOTmKlZxgAzoIQJ61wuXoIb6ituJMDi0ApDcA31iW?=
 =?us-ascii?Q?k+G5VEHwSzeQ6YeLvFrjo+X7sjQW4KUfLSxHUKo1VaRZ99VvzJvy3Im2Fts5?=
 =?us-ascii?Q?iJkKMMKayJDBR70SdDlPIj99nEmlYbX6YjI59LuvTbHMm7ECBWIEWZ7UwRJA?=
 =?us-ascii?Q?zKNYTfHY++1/YT2ku5Lfsoxw0Vfi2NZHuYM8UsQ8G/BwqL7shUMW7vzsa0a1?=
 =?us-ascii?Q?qEGLEUFl5hJu973YtoFkD/Vu6v6pf48DASFRN1+RDQYgAWnyBSx4wrhOAw17?=
 =?us-ascii?Q?hS6cR8TsXM1HnmkLqkcevi52k2o1d0YR76owr37lVI/6bDMRzW8nnOWcNIW4?=
 =?us-ascii?Q?JIA52Da3Mlr5xrxIL/0ftnL/reK7zvRX1uC5NWJBO4cm9I4irxvF85qg3/Zg?=
 =?us-ascii?Q?NMj4/YgPlebWpHExY9RwitWlR2r4yYot2MtKN5DDouln88he7CC3ml6UXcjY?=
 =?us-ascii?Q?hlcrJ4SY9fPdYEoHu7q+xko=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbeb913-6577-4dc3-fdef-08db08a628a8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 00:56:34.4376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogpjIOc5RzxjXNouY8TWNb0NB0G8KUbJnoIEDVnpQ//xUvWt2/WEVqt0i6zvR0VG6faA882kMJpeaIE+lmF5xXkXl4KLcDzWmr6BCoDSDLZ8FdhbysXXiY3eBtqJGBZK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8545
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
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 devicetree@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Geert

Thank you for your help

> > --- sample -----------
> >   rcar_sound,ssi:
> >     ...
> >     patternProperties:
> >       "^ssi-[0-9]$":
> >         ...
> >         allOf:
> >           - if:
> >               properties:
> >                 compatible:
> >                   contains:
> > =>                  const: renesas,rcar_sound-gen4
> >             then:
> >               required:
> > =>              - foo
> > =>              - bar
> 
> As it is under patternProperties, the "if: properties" applies to the
> properties under the ssi node, where you do not have any compatible
> value (and definitely not the "renesas,rcar_sound-gen4" value, which
> belongs to the _parent_ of the ssi node).

Hmm...
I want to do on above sample case is "required foo/bar when only gen4",
but my concern is it *always* requests "foo/bar" even though it is *not* gen4.
May be it is opposite?

> So I think the only solution is to move the "if" up, and thus duplicate
> the ssi node description:
> 
>     if:
>         properties:
>             compatible:
>                 contains:
>                     const: renesas,rcar_sound-gen4
>     then:
>         patternProperties:
>             "^ssi-[0-9]$":
>                 ...
>     else:
>         patternProperties:
>             "^ssi-[0-9]$":
>                 ...

Hmm... I have tried this but it was same result...
I'm not sure why it doesn't match as I expected...

I will try to post my current patch as RFC.
I'm happy if someone try it, and confirm my issue.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
