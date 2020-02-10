Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA5C157D78
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:33:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D301F1671;
	Mon, 10 Feb 2020 15:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D301F1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581345234;
	bh=zN6eg0jf5O8YAX/ZViuDWLm39kNz8vPSne8TzAgD/+w=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GpyGMszTcTsFH0kAYSzFlPfnDYNnnhBaz5lRs5lmV7sl02m0CusjJnMnA4Q73FxbJ
	 sPTKcdwmxsWmaOQcu2Pt/hC62I8RGFzTsUXcm7pQ4RxJPFg/C5600lSzcUEEKBsn+N
	 mLlsczB03cHD8YMHRrhkm2XuR5zQCauEOtM0sWpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEF49F800E7;
	Mon, 10 Feb 2020 15:32:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1193DF800E7; Mon, 10 Feb 2020 15:32:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3960AF800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3960AF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="ib5lOT+m"
Received: from [100.112.197.31] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.eu-west-1.aws.symcld.net id A8/3E-37141-769614E5;
 Mon, 10 Feb 2020 14:32:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VTfUxTVxzl9r0+HoRuz4LjrrNz1EEWxqstce7
 h5gIuuMaEOIxhxm24djzaJm3BvpaCJgxY+DRi/WBTghEEGUMRqHZWLDiqlGLCNgsG4lDGqBug
 EwdM4kC6tq+67b9zfufcc8+9uRdH+A8wAU7nG2i9Tq4RYeGoaj1fRSrVKZmSnx8KqeGbDg517
 ssKDlUz4cEo17VihHo87KNDXXUYZVuxYFRl1yEu1bHYBpLDZB3zJZjscu2dUFm9xShrtE9zZJ
 bWSkzW80czJmu/eAuVzVte/RDfzVXrFDn5n3FV349ZsNyf1uV/87uTUwRqhFUgHAfEGQRWdd9
 CWeJE4aPHHoQlFwBcOvgE8xOUcCHQYWsAfsInzBzYM9uEseQOgKNuu08JwzGCgkddv2B+HEXs
 gTPjfweyEOIuB949+5DjFyKJVDhxbjC0CuA+01bocaaw/kT41eRwIAclYmFlpz2QwyM+hea24
 4GlfGILbO1aCszDiPehrWwI8WNACOFC8dkARohoeNtzKuCHBAGb7D8iLF4NpydXuKyfhgMlo4
 CdJ8DBEU8Qx0D7Dw3BtULoPnUgOE+D4x2lQRwPF0rLuSymYNOBUtR/FEi8DlccBexYA70tJ4L
 2ODh/bzhYYQ18+qcjcG+QaELhZPsU1wwktf+pzeIEWH9lDmPxm7C54T5SG7iKVXDghAetB2gr
 eFuhVytVBq1crSGlEgkplSaS0qSNZOJGsXwfqRDTRtJEMwZSKpabGDFToP1ckyXW0QYL8D28r
 NzrAhv4tm1W7AAv4xzRal5Tekom/wVFTlaBSs6o9uiNGppxgDU4LoK8ZKVPW6WnlXR+tlrje7
 7PZIhHiKJ4i9k+mcfkyrWMWslKNwCJm6dPnkb4qC5HRwuieaH+DMJvUhl1zyOefQI3EAoieSA
 kJIQfkUvrtWrD//UZEI0DUSTP498qQq0zPN9pxleC4ysxsiHZX8Ig/1cSFHEoPnxRl1VxaYQ0
 VR0ZKW9tufLb5TLNr6baT24YRKf35b1yZmztuoq57vS1Gdqj1vCRHWW5Lf17B6ySXdWjcwsTF
 59ueSlGOb7DmOB8zXuoe/oj88e3TbuOM2O2/va6mubxvfuLWx48ir/aLa0Jq9+8Kbbfta3wkr
 fayY+WeTsOHitMeuO8eEItfZJODvZNNXq/Llly1/ZuF2RsXuyL3TpHxV7/S7Scc9OWGnr+3dl
 Mw/71VNF793aGLO/sy4ub/cJiNmKKw71xaUnWC9rO6qnvej7oHd1QlbqksB7bZpVfxROvDfWW
 x5g6D+fdX3YWM9mu3drGjJS3CClTaKtL2xTlesctQhmVXBqP6Bn5P9YDJaB/BAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-27.tower-292.messagelabs.com!1581345127!892444!1
X-Originating-IP: [104.47.18.104]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32025 invoked from network); 10 Feb 2020 14:32:07 -0000
Received: from mail-am6eur05lp2104.outbound.protection.outlook.com (HELO
 EUR05-AM6-obe.outbound.protection.outlook.com) (104.47.18.104)
 by server-27.tower-292.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Feb 2020 14:32:07 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLhdAQVgGWctRYAmUY3usvfbp/kOmBsRXY4i0gZ543qMB87MwS0Y6SzRIsiTHs5eSHivXywbp2tBQDzTYqqhq9iYVWwNQZYOix4vEYy6f00O2KL3fOpEmeudozAOzwKC/ado/7VvUuByhMb+nUglXJwqtH6xKCM7NwYU84+iNlS7hWfEF7XPoPRI2RwQIruCfM2jzWEHSYErACGubh78KqrwLfljn/P8tbOVo0zBgi2lO2+XL9ApI8c5ACPqfsPaPHH5HjAKK6yImsL78BHUhde/DLosNSKSJbYqzokO1mN2Wt25MnUkKcbugfXMPTJDnM4Lw++lzi+0bZBc9BKsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xsszi8wnSjqu1NWttcbSpJ8C2FQ8NIbeYwuCU+fYVKc=;
 b=N1aDMiR7UyGHZCLktm/Ty/otZtGpWAWCqP+KR7ilSnGG3CspYZNjur2cK3DEFZDEOq/Jgd7XC8B978mb+rLUTQU4YVwtu8pLQiK+ytOoeNnuipWJ6Uk/Kecn1lEw2ALuFE6Afe/x9BHwrNjXX/PvjW5V17xysIA6QLUt0rwf+CaJaH38DlUjuuH3IxV4bBb6+hKendw+ULWV/wsRH1f9KjcO0a4NpI+3SGmfr1l3/qweXdr285vlQnF7ZzvdRY4hO7kIEdMG8kVEAbxzNhHRO3bFN/dWBf6mZTJ3b/s0oSHA4rX65crLXcxtiVcf8T4JM4MhcuJoW2RPZnw7hbKAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xsszi8wnSjqu1NWttcbSpJ8C2FQ8NIbeYwuCU+fYVKc=;
 b=ib5lOT+m0QXYVO7mGt/AscukjCAZwN2eDXDjJWiO4VNpP1+EMDLF5UtadiH9i1FB6ctZqOMLJSPiBKrd6sh35pjhnDtnU4dFe2i0zRYfnRu8fDfnLM3qLBdmioLIDXtrcweaJOFZpzNiyrJfp3SaoQF10W2lN9AIsNBuixIwsN8=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2677.EURPRD10.PROD.OUTLOOK.COM (20.179.0.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.26; Mon, 10 Feb 2020 14:32:06 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2707.030; Mon, 10 Feb 2020
 14:32:06 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Brent Lu <brent.lu@intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: da7219: check SRM lock in trigger callback
Thread-Index: AQHV3+t05QGFzNuez06VZ5VdF8K2kqgUfAmA
Date: Mon, 10 Feb 2020 14:32:05 +0000
Message-ID: <AM6PR10MB2263F302A86B17C95B16361280190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
In-Reply-To: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bda9da1c-915e-49b6-ff41-08d7ae3600c1
x-ms-traffictypediagnostic: AM6PR10MB2677:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB26774C2738A2E21368F4EB5AA7190@AM6PR10MB2677.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39850400004)(136003)(366004)(396003)(199004)(189003)(81156014)(110136005)(54906003)(81166006)(66556008)(7696005)(76116006)(33656002)(66476007)(66946007)(8676002)(64756008)(66446008)(55236004)(8936002)(26005)(53546011)(186003)(6506007)(2906002)(52536014)(478600001)(316002)(86362001)(71200400001)(55016002)(9686003)(5660300002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR10MB2677;
 H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c6Nd8AvOJqNONXgjX1w1NU9nS6DqoTDT5TIyK71Wq14Kzcjm2Xq4C6SNRmjiBLHETjlKhgjNr/5zSu9qPBL0AuCk0+2gP6k2aR/XkGlKiLY+zCx4vPyIQWbJW7Ebc2Z61FXULWt99ERQVaZjZHwoyqPgSCyzXcJ+z/awfm70HFh3PyA3Ho3+k+qCWbzculJgerXrXHwHGKN807vKlEq3SJViJqdxWoxk2awcDJYu5Q/DpeYvDxRzLquKgYgEw0d67ulUkT0KuFp+rEJuCzFasGd+1S0USTrJv1oTv6HBgj4RypWV3kWGzy+IQBX6Iv/gFJpEd4qJsXhOp4aU556DlvFulnJiL3Al+DVVfd9qc1GHUZjy1AlDY9RnoMrVUXewhpH3PNqWvIy0of0rJYjtufyFtqevdRcjXYkIqbb4JEN1oemHY55gxfjqFWmRdnDU
x-ms-exchange-antispam-messagedata: vGRd/gZSr9BVrSpaopthSWO+/uRRTnzOhM3UJoJfkYa9IxyknByNzqHmcdWqy7F1SCKe3KqcOiJqIfbcooCQgPpmvji9ZgP+oumAS14XMISLlEjqcuBd1D9eXr08fYjgbB+HICA9gmhaO/IB1+RxgA==
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda9da1c-915e-49b6-ff41-08d7ae3600c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 14:32:06.0035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pj8ErrMpFarKdjgWExjkTPyFlC+84Cmssn9+an/rP6MPIj+EhF6HFYJ5h2teD+HrQIT1COX9k/b/6Fta4OBq5YPhH0GLT4A0gtzqgiyUHO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2677
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mac.chiang@intel.com" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 "cychiang@google.com" <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
	callback
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 10 February 2020 08:17, Brent Lu wrote:

> Intel sst firmware turns on BCLK/WCLK in START Ioctl call which timing is
> later than the DAPM SUPPLY event handler da7219_dai_event is called (in
> PREPARED state). Therefore, the SRM lock check always fail.
> 
> Moving the check to trigger callback could ensure the SRM is locked before
> DSP starts to process data and avoid possisble noise.

Could ensure? This change seems specific to Intel DSP based systems, at least
from the description. Having looked through the core, the trigger code for a
codec is seemingly always called before the trigger for the CPU. How will this
work for other platforms, assuming their clocks are enabled in the CPU DAI
trigger function by default?

Can we always guarantee the CPU side isn't going to send anything other than 0s
until after SRM has locked?

> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/soc/codecs/da7219.c | 68 +++++++++++++++++++++++++++++++--------
> --------
>  1 file changed, 45 insertions(+), 23 deletions(-)
> 
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index f83a6ea..0fb5ea5 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -794,9 +794,7 @@ static int da7219_dai_event(struct snd_soc_dapm_widget
> *w,
>  	struct snd_soc_component *component =
> snd_soc_dapm_to_component(w->dapm);
>  	struct da7219_priv *da7219 =
> snd_soc_component_get_drvdata(component);
>  	struct clk *bclk = da7219->dai_clks[DA7219_DAI_BCLK_IDX];
> -	u8 pll_ctrl, pll_status;
> -	int i = 0, ret;
> -	bool srm_lock = false;
> +	int ret;
> 
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> @@ -820,26 +818,6 @@ static int da7219_dai_event(struct
> snd_soc_dapm_widget *w,
>  		/* PC synchronised to DAI */
>  		snd_soc_component_update_bits(component,
> DA7219_PC_COUNT,
>  				    DA7219_PC_FREERUN_MASK, 0);
> -
> -		/* Slave mode, if SRM not enabled no need for status checks */
> -		pll_ctrl = snd_soc_component_read32(component,
> DA7219_PLL_CTRL);
> -		if ((pll_ctrl & DA7219_PLL_MODE_MASK) !=
> DA7219_PLL_MODE_SRM)
> -			return 0;
> -
> -		/* Check SRM has locked */
> -		do {
> -			pll_status = snd_soc_component_read32(component,
> DA7219_PLL_SRM_STS);
> -			if (pll_status & DA7219_PLL_SRM_STS_SRM_LOCK) {
> -				srm_lock = true;
> -			} else {
> -				++i;
> -				msleep(50);
> -			}
> -		} while ((i < DA7219_SRM_CHECK_RETRIES) && (!srm_lock));
> -
> -		if (!srm_lock)
> -			dev_warn(component->dev, "SRM failed to lock\n");
> -
>  		return 0;
>  	case SND_SOC_DAPM_POST_PMD:
>  		/* PC free-running */
> @@ -1658,12 +1636,56 @@ static int da7219_hw_params(struct
> snd_pcm_substream *substream,
>  	return 0;
>  }
> 
> +static int da7219_set_dai_trigger(struct snd_pcm_substream *substream, int
> cmd,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	u8 pll_ctrl, pll_status;
> +	int i = 0;
> +	bool srm_lock = false;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +		/* Slave mode, if SRM not enabled no need for status checks */
> +		pll_ctrl = snd_soc_component_read32(component,
> DA7219_PLL_CTRL);

I was under the impression that 'trigger()' was atomic? We'd have to have
some kind of workqueue to do all of this, which means we'd almost certainly lose
some PCM data at the start of a stream.

> +		if ((pll_ctrl & DA7219_PLL_MODE_MASK) !=
> DA7219_PLL_MODE_SRM)
> +			return 0;
> +
> +		/* Check SRM has locked */
> +		do {
> +			pll_status = snd_soc_component_read32(component,
> +							DA7219_PLL_SRM_STS);
> +			if (pll_status & DA7219_PLL_SRM_STS_SRM_LOCK) {
> +				srm_lock = true;
> +			} else {
> +				++i;
> +				msleep(50);
> +			}
> +		} while ((i < DA7219_SRM_CHECK_RETRIES) && (!srm_lock));
> +
> +		if (!srm_lock)
> +			dev_warn(component->dev, "SRM failed to lock\n");
> +
> +		break;
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct snd_soc_dai_ops da7219_dai_ops = {
>  	.hw_params	= da7219_hw_params,
>  	.set_sysclk	= da7219_set_dai_sysclk,
>  	.set_pll	= da7219_set_dai_pll,
>  	.set_fmt	= da7219_set_dai_fmt,
>  	.set_tdm_slot	= da7219_set_dai_tdm_slot,
> +	.trigger	= da7219_set_dai_trigger,
>  };
> 
>  #define DA7219_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |
> SNDRV_PCM_FMTBIT_S20_3LE |\
> --
> 2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
