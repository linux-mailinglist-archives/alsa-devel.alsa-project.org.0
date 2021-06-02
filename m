Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC74399137
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 19:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E8E171D;
	Wed,  2 Jun 2021 19:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E8E171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622654098;
	bh=JQEyr8cwe43NustERocbDYPZLrJKyTxvdd2fEEgO9JU=;
	h=Subject:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdrPVh/KaNOKE8OYHVvbjxVkixIBuBCyiLEOKIJqX/jr7jzn5guHCoTbBfRyWg+wl
	 9rRb/NF3At6dEaWJkp1zOLlprUjwE2CzhxVUVgp+PmQqAzK65wOjbiz+t0ZuC9PQOv
	 PNYTDCr1jUP3mD+31JAT37P/T7SIYSXHqcjiFXDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 023B3F8049C;
	Wed,  2 Jun 2021 19:14:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BADBF8049C; Wed,  2 Jun 2021 19:14:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=MISSING_HEADERS, NICE_REPLY_A, 
 RCVD_IN_MSPIKE_H2, SPF_HELO_PASS, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3064F80103
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 19:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3064F80103
Received: from [100.112.131.194] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.us-west-2.aws.symcld.net id 30/C2-02927-F4CB7B06;
 Wed, 02 Jun 2021 17:13:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleJIrShJLcpLzFFi42LJePGQR9d3z/Y
 Eg3vNXBZXLh5ispj68AmbxbcrHUwW33o+sVt07upntfh0/gKbxYbvaxkd2D02fG5i89g56y67
 x6ZVnWwe+94uY/NYv+UqSwBrFGtmXlJ+RQJrxoqmN+wFi/kqDhw4zd7AeJG7i5GLQ0jgP6NE1
 +NWVgjnEaPEk60b2bsYOTmEBUIkpn1dAZZgFtjKKHFgQxNbFyMHUFWIxPGLgSA1bALaElu2/A
 IL8wrYSnzY6goSZhFQkbg8fRoTiC0qEC6xu+MlmM0rIChxcuYTFhCbU8Ba4uub7awgrcwCmhL
 rd+mDhJkFxCVuPZnPBGHLS2x/O4cZxJYQUJRYd6WLEcJOkOj594htAqPALCRTZyFMmoVk0iwk
 kxYwsqxitEgqykzPKMlNzMzRNTQw0DU0NNI1NDbQNTI10kus0k3UKy3WLU8tLtEFcsuL9Yorc
 5NzUvTyUks2MQLjJqWg6c8Oxr+vPugdYpTkYFIS5S3ctD1BiC8pP6UyI7E4I76oNCe1+BCjDA
 eHkgTvvV1AOcGi1PTUirTMHGAMw6QlOHiURHiXbQNK8xYXJOYWZ6ZDpE4x6nIcOzpvEbMQS15
 +XqqUOG/ubqAiAZCijNI8uBGwdHKJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvKMgUnsy8
 ErhNr4COYAI6QsBrG8gRJYkIKakGpvRLWb9leCYxTmTJfGfcav1ISWl9t2Ddl7t8NvJXF9Sn/
 399guXFkhvzTkWvzv8wdydriJzKLJ4Zm/0m3pZzvRV8l/VTfHGmjY+rpveigKmsphxPtq67zV
 zYd0IxcrOWdF/s6rq3bp+3HVhcv0R/bmqbW693IrN5279ZPd9YWFba1azZK8TEeeNfqfzJNhf
 ryqCmDaecXrh7JTNNX/otrN66Qs3faxV3cYUwg9vbAqZHvsfOF74sL4hsXy/ec+kBn13q3Q23
 /TapdO3orHmVte/LDmbmyfu+zDl2PTTMfIKwrnfYRqa16RNy1jwW/lwba7ntmf487jk3nhyUt
 J+2/dfl/O8rF33f3H3wz7HcGCWW4oxEQy3mouJEADsz55aiAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-8.tower-336.messagelabs.com!1622654028!3367!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4524 invoked from network); 2 Jun 2021 17:13:49 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
 by server-8.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2021 17:13:49 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id E832D26722CC2B891E39;
 Wed,  2 Jun 2021 13:13:47 -0400 (EDT)
Received: from [10.46.208.158] (10.46.208.158) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Wed, 2 Jun 2021
 13:13:47 -0400
Subject: Re: [PATCH] ASoC: AMD Renoir - add DMI entry for Lenovo 2020 AMD
 platforms
References: <markpearson@lenovo.com>
 <20210602171148.3179-1-markpearson@lenovo.com>
From: Mark Pearson <markpearson@lenovo.com>
Message-ID: <de66d2cc-f6b6-b68c-8f18-e6ecb1b1890d@lenovo.com>
Date: Wed, 2 Jun 2021 13:13:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602171148.3179-1-markpearson@lenovo.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.208.158]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Cc: alsa-devel@alsa-project.org, Gabriel Craciunescu <nix.or.die@gmail.com>,
 lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org, stable@kernel.org
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

Man I'm having a bad day....ignore this email. Did not mean to resend
this previously submitted patch :(

Mark

On 2021-06-02 1:11 p.m., Mark Pearson wrote:
> More laptops identified where the AMD ACP bridge needs to be blocked
> or the microphone will not work when connected to HDMI.
> 
> Use DMI to block the microphone PCM device for these platforms.
> 
> Suggested-by: Gabriel Craciunescu <nix.or.die@gmail.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  sound/soc/amd/renoir/rn-pci-acp3x.c | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
> index 19438da5dfa5..c9fb1c8fbf8c 100644
> --- a/sound/soc/amd/renoir/rn-pci-acp3x.c
> +++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
> @@ -199,6 +199,41 @@ static const struct dmi_system_id rn_acp_quirk_table[] = {
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "20NLCTO1WW"),
>  		}
>  	},
> +	{
> +		/* Lenovo ThinkPad P14s Gen 1 (20Y1) */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20Y1"),
> +		}
> +	},
> +	{
> +		/* Lenovo ThinkPad T14s Gen1 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20UH"),
> +		}
> +	},
> +	{
> +		/* Lenovo ThinkPad T14s Gen1 Campus */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20UJ"),
> +		}
> +	},
> +	{
> +		/* Lenovo ThinkPad T14 Gen 1*/
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20UD"),
> +		}
> +	},
> +	{
> +		/* Lenovo ThinkPad X13 Gen 1*/
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20UF"),
> +		}
> +	},
>  	{}
>  };
>  
> 
