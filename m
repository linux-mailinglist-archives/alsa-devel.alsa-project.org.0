Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC04118216E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 20:00:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B45516A6;
	Wed, 11 Mar 2020 19:59:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B45516A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583953240;
	bh=IOYmXOdurKVshrP8PR+wS1/h45gg+I1u9ZamrfuKj48=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LhiI18fwjFf4OrNq5vvVz+kLZN4wrVUqCA8KTb8bRN+3q/0N8DOto/IUKbRLaaT+2
	 A7cgk4NwB/Odg9tJRym55raxDzEqrUe3txG8eSMQm1bFLzMwG0ungmpppXZiWp9Af4
	 /NFOikwwgtA0PdGYTVSPKXjGu1Mqywon9q2BfDK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F727F800B5;
	Wed, 11 Mar 2020 19:58:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D778F801A3; Wed, 11 Mar 2020 19:58:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA078F80141
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 19:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA078F80141
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 11:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,541,1574150400"; d="scan'208";a="353946803"
Received: from fjan-mobl.amr.corp.intel.com (HELO [10.251.25.157])
 ([10.251.25.157])
 by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2020 11:58:44 -0700
Subject: Re: [PATCH 2/2] ASoC: wsa881x: mark read_only_wordlength flag
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 vkoul@kernel.org
References: <20200311113545.23773-1-srinivas.kandagatla@linaro.org>
 <20200311113545.23773-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2c56d592-719f-bd87-25cb-c5028bde729b@linux.intel.com>
Date: Wed, 11 Mar 2020 13:58:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311113545.23773-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 3/11/20 6:35 AM, Srinivas Kandagatla wrote:
> WSA881x works in PDM mode so the wordlength is fixed, which also makes
> the only field "WordLength" in DPN_BlockCtrl1 register a read-only.
> Writing to this register will throw up errors with Qualcomm Controller.

it'd be good to clarify the nature of these errors, i.e.

a) is this the Slave device responding with a NAK?
b) is this the Slave device responding with COMMAND_IGNORED, and those 
responses not handled by the controller?
c) something else?

Thanks!

> So use ro_blockctrl1_reg flag to mark this field as read-only so that
> core will not write to this register.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/codecs/wsa881x.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
> index b59f1d0e7f84..35b44b297f9e 100644
> --- a/sound/soc/codecs/wsa881x.c
> +++ b/sound/soc/codecs/wsa881x.c
> @@ -394,6 +394,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
>   		.min_ch = 1,
>   		.max_ch = 1,
>   		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
>   	}, {
>   		/* COMP */
>   		.num = 2,
> @@ -401,6 +402,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
>   		.min_ch = 1,
>   		.max_ch = 1,
>   		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
>   	}, {
>   		/* BOOST */
>   		.num = 3,
> @@ -408,6 +410,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
>   		.min_ch = 1,
>   		.max_ch = 1,
>   		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
>   	}, {
>   		/* VISENSE */
>   		.num = 4,
> @@ -415,6 +418,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
>   		.min_ch = 1,
>   		.max_ch = 1,
>   		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
>   	}
>   };
>   
> 
