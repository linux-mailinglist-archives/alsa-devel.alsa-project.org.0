Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1206B6CB6
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 01:00:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAA3F130B;
	Mon, 13 Mar 2023 00:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAA3F130B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678665613;
	bh=BAkZe6lownUmTtMghUTgvuaIlpRZsnffRqWFWNy8DxE=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P8OfM4D4gDgG9wRvfzguh5Z8Gr6AKmc+nf4e4cA8DJzTh3rvdqTTP5WINYJGH9YpE
	 YDhAUbeWhGVj/gPUuCrsdsgVyrm1uUSbPPx6s9D0CBHGUCg/+g6HPfn401HylWyICF
	 RbkOoZq9hVJeuyUlgFHKJfl55R6QV2SmjdFDKZ9U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E9DDF8032D;
	Mon, 13 Mar 2023 00:59:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAA99F80423; Mon, 13 Mar 2023 00:59:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DF2CF80272
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 00:59:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF2CF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=a369zzH9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZCg+b9e6CYWj3xsnCPaVcXamW2qSe7vs3WwbRSP9ETMQgjvtFWraBnj2fdhNmWFOBWDy3M31z/cLH8NIDDkTteTimRo0k9S40UzGp5jQd2u6+sxRZC7Bm+w8D/US7L/D/7aZtOWTIGZUap/Fbzmd1ZuDifce33rQ2UpbZ8neHMEFogFSDuPPfZ+U0OmHEdYnOb0maDHBe6U9ve0mTrc/Q3a+ylZL+33cpspLEHLRydB6ZiQmVydJqAuDMTvof1/N23GcpveBEFANsSDeLlJe0NTu5rawGa9+5g554Q0o7qzGC5fLYth/rDJx+PZRj2mgGqKZyGgJ7kJpVfMXpPWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=282NMGWcT+nZDmrHiIaC7cFlIHXAOwNehceSsExkiik=;
 b=D1BYVcgkzhhkbcGsqZJQJ+IjeK4RHNkOLfW6oowC7u8ych+e82ZfTtPoVsvLNOFoPIyyDKZUTx776nPYVOwfheEiB0KfkG0mE+Yy7w3+a9YkZAyvsowK6WFpIqrCvCYNfRHqsx1mLte+q/quYZV+NtLFn+TQknIiWROKSYuk/baGWNmgntlCG7o/YkS7DiTj0noIQ9vWgJsmT00ZZVPmQWPE9SAKsfnXC57Aj4LfaIKocKhR9C8hwYtuZ5FhopsHi9qvjnNbx1NRUjeQ/b1qeJ+ZejS57v0xMzy9WIWaHgYueRnh1mcdoPMz74JIzNd20BTr+G3GnOuPqfBPF+waNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=282NMGWcT+nZDmrHiIaC7cFlIHXAOwNehceSsExkiik=;
 b=a369zzH9G4lknRz2pJ8bto7kvkLXnHlHyR0NIZtJ1i2LdUfNl81vkT00glWCTny4K+Q+l2+1EBmPVxWU5XW0cUGII6bKtt5t1p+16mrfvrdqxe0HICLBZvanTnR1A77piqir9udAtlezibat413kN2IMS1VMGYZe2LqdcS9rtgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5503.jpnprd01.prod.outlook.com (2603:1096:404:8024::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 23:59:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%8]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 23:59:01 +0000
Message-ID: <875yb5frnl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: soc-pcm: fix hw->formats cleared by
 soc_pcm_hw_init() for dpcm
In-Reply-To: <1678346017-3660-1-git-send-email-shengjiu.wang@nxp.com>
References: <1678346017-3660-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 12 Mar 2023 23:58:59 +0000
X-ClientProxiedBy: TYWP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9b2378-74c4-4a84-4c94-08db2355bfd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YVr0dBCM6S+5SuAslA+TAxNZX7ApHRYpAFqqCuQB+K+2jLmnKi6uxO8B3l6vMreGEaXN9LDJTZp4TdYofN5AuMYlTwJbGk2uUdWG2nL1Ir7Qai8YfY1OAdV8ok9QTvbhVMRoaJyAnMYrYCNoKzwAu2y8wU+7JnWCNib9x6f41jJEj7ueLdUnzQT9x+0njF1IgtLWYLS5Z2iN09mnFOhXtsN7lb2kL6lzoYO/A1mZmDdytCvXZgRgVVekbGs/i1axRxeXYHMc2M0aMnZ7sck0yTO0sCbvZRfBWkVXWZ9hiZQWTjE2PN2PPZoP47R9gWG7VyID1iXUaKITe+ogAkiGNe8M8RdJWaXnrksIQUYtkDpX0zknb9TXJtpZA/CnxZpbsqLxjQCXUf2k87y+HOLQG0jtOctDIWl5eFVhlhJOP5gFaKhDqsYYCbImNE6K/8a2whCf7MI3g4ixYCrkfq36Qsw6YK4jE4y6V2Y8a0+5M25y6fMHbnCh7yf2cMdofLG3qKYrRDfvJXWzTEccS176biuTiaLUfa4Y5QSU+j/YQALmeIjqFbJUvC9OvKq03PRDzcdgUrbtSI6kcNhk85qMIZdzaezKXNi/GmIOGvclKQI/33Ve8ok52DtvrgNbOB7Di/Orwv6T9VN1b0TqnQgDzr4UtGe/zf4VlzPAU2YrkzCTUs3U9h5ifspN7iPTCyEPPO46Q/fq6xHwy4Xmm1BzqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(2906002)(38350700002)(52116002)(41300700001)(66946007)(66476007)(66556008)(8676002)(4326008)(316002)(478600001)(36756003)(6916009)(86362001)(38100700002)(5660300002)(6486002)(26005)(6512007)(6506007)(2616005)(186003)(8936002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sOskYpvIwHIl1b6HYDWBxEF3U6hXDyZ5qqj/vyr9MKCdnO4eZdqEBDXrWyKV?=
 =?us-ascii?Q?BkEfsKZNDhh4Qf5L0Xz1sa94NGWbyF8CLQz7gPWK2C3Ul0Jz9OCZ2DEgtGPA?=
 =?us-ascii?Q?0AFsMaJAfQT/6qNhD+eoNIt7skEFay014HF/YlqAnAQYza7NgP8FDcPhipt/?=
 =?us-ascii?Q?khCl8LDT5ZIk8Fpe6wkW0knTu80SNnSNj4D5mazzUVSzzpuxAJe+opn5mLv9?=
 =?us-ascii?Q?+T1XMhi7c8ZTBtiy8HQAcbz0S1gX/vhZHySZEq5twKef54Eo+5RpUJ7FA1EQ?=
 =?us-ascii?Q?uS7g7hTpnzVTelPIgdq/RAiHCPzrEVEISo9BEOsXcXXHT2OkRPhxYovRut6H?=
 =?us-ascii?Q?pWmCxk/157/C+CPsU9nn09V1duCgdsvC2nyArL5EPRZjisYR56rXUiOFS13Q?=
 =?us-ascii?Q?qPXkYlR8XpIygH8HBd2IFqJ+XGc6Yta/B/HLKWIPznPw6RUyVlavkvkvacxp?=
 =?us-ascii?Q?bIBYOkHx8NQy8IHNSvCDqsbL1U3bIIsQ3rj/dum80TkQVr6RGEwziARZunRJ?=
 =?us-ascii?Q?6nAQ8d/vD7eA/EwJFCPeY6ovTNszFSTH6i5UPQL881psBOh5sob7vW02KZT4?=
 =?us-ascii?Q?le6nZ6vAJzyFWRvEGHXxVfk8F650G9hA5BRRlUuJ+a2iH/QlAXzNcrrz0Sjl?=
 =?us-ascii?Q?51v2KZYKkcJTUhDniNnRwtOoQIjw/i/7YcB69jebLHOmxqEWrtvR6PI50IZf?=
 =?us-ascii?Q?nz+SlxbWbXFZERCS9HXIdAQelNBQg5qtbl5TT1nGkFCo7oL2RusGJlNTtCXx?=
 =?us-ascii?Q?8+NWoWhJ1hLGLze0w+Pc1e7z7pfWwfgKT1p7U3sIlXTRonoP+l1MKLUNJryc?=
 =?us-ascii?Q?upnDmyYfS4kc5TIthWFOID92WhhlZKgpRrQmCbHgcos4CqhhP4+1uDJu6Bme?=
 =?us-ascii?Q?n2TYofmkIWZMW+QC847UuAIDhwZmm3/z5+w4LtcPYQxJQUAXfm8FxJztucrp?=
 =?us-ascii?Q?VIoZRjz+Xd7VWyc/2FHfYkuGW5zMeFP681VJwQ8RDObtYqQn1yenppwaY09S?=
 =?us-ascii?Q?ilivgHAqav8+7rtpVgix4huPte4Gc02f/rfa6Psm0u/gMdYxwnQO06AA5qW0?=
 =?us-ascii?Q?xRDnz+HtTLeAu+aUAqo9IGd9IuVQB2kLrEGp1UaoL6sJspD/1SpKGY59D/kf?=
 =?us-ascii?Q?lnswKyEtoIBCRpjdnkOLRghSKnqGM2zdYyehwaxGqjRPWGGaYOE1yHu3a3ov?=
 =?us-ascii?Q?c46O7CwC9iNrNKtbpSfBUnx1r95kWhRIV6vEpP4mWCTOp2d+MCsnOhHH1av3?=
 =?us-ascii?Q?pelAK79TBvzIpNdSuGVTafTc/708S1j9Ot5eaj7xnHpODt+zPSjMtth8/616?=
 =?us-ascii?Q?uNkjiLe2ovh+/6LI0ifvA2R+VTMC+NZpmgh5uW/0gAs8yN2JODIspaAI7cOF?=
 =?us-ascii?Q?ZRVMaJcPPoqpik3G2eoAYG03Cew5c0MwZaZ9PsZscRhgSW7LWNPRYCMRqpbl?=
 =?us-ascii?Q?mXF28k234gkQ3zWu/M6EPhyVgDI7FkmPRxNKYM/FbhII/HiBtAR/ekKW1gjS?=
 =?us-ascii?Q?4tB2whB32WVYILy0QThsr9vcNHDhZ3O3EKYAehtWN6V7J3GEz7FrzoDs3sew?=
 =?us-ascii?Q?cvFMsrXpW+aaUbjD+kSpYOSwX4X6qCJ0WpQxWfcbmri+jwq+7hANBUyAQ4vU?=
 =?us-ascii?Q?M5rAFMFrKNRXmbC6zdhS6PM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce9b2378-74c4-4a84-4c94-08db2355bfd0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 23:59:00.9097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zAIC+ptzk7eerZL5Ka/+kbLuRBclTMvC9k/pIt4bJpnHUlAATQNVHFG4RlMmKjf4x/qWJQ7D3Vp0gr+noQhyw8PtXHM12qJcnIaB20rX9Yp4R47O5ZmE2sj+4U8Xcfl+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5503
Message-ID-Hash: KO65KX76B3TBXUYSXXM2Z45KM5ZCLOUE
X-Message-ID-Hash: KO65KX76B3TBXUYSXXM2Z45KM5ZCLOUE
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KO65KX76B3TBXUYSXXM2Z45KM5ZCLOUE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Shengjiu

> The hw->formats may be set by snd_dmaengine_pcm_refine_runtime_hwparams()
> in component's startup()/open(), but soc_pcm_hw_init() will init
> hw->formats in dpcm_runtime_setup_fe() after component's startup()/open(),
> which causes the valuable hw->formats to be cleared.
> 
> So need to store the hw->formats before initialization, then restore
> it after initialization.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/soc-pcm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 5eb056b942ce..7958c9defd49 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1661,10 +1661,14 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
>  	struct snd_pcm_hardware *hw = &runtime->hw;
>  	struct snd_soc_dai *dai;
>  	int stream = substream->stream;
> +	u64 formats = hw->formats;
>  	int i;
>  
>  	soc_pcm_hw_init(hw);
>  
> +	if (formats)
> +		hw->formats &= formats;
> +

If my understanding was correct, dpcm_runtime_setup_fe() (B) is called
after __soc_pcm_open() (A), and you updated (B) part.

	static int dpcm_fe_dai_startup(...) {
		...
(A)		ret = __soc_pcm_open(fe, fe_substream);
		...
(B)		dpcm_runtime_setup_fe(fe_substream);
		...
	}

But, it is doing same things under (A), too.
Do we need to initialize hw many times ? I'm not sure.
Can we simply remove soc_pcm_hw_init() from dpcm_runtime_setup_fe() ?

(A)	static int __soc_pcm_open()
	{
		...
(X)		soc_pcm_init_runtime_hw(substream);
		...
	}

(X)	static void soc_pcm_init_runtime_hw(...)
	{
=>		u64 formats = hw->formats;

(Y)		snd_soc_runtime_calc_hw(rtd, hw, substream->stream);

=>		if (formats)
=>			hw->formats &= formats;
	}

(Y)	int snd_soc_runtime_calc_hw(...)
	{
		...
=>		soc_pcm_hw_init(hw);
		...
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto
