Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0771A2F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 16:23:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1AE018A1;
	Tue, 23 Jul 2019 16:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1AE018A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563891819;
	bh=U9z0QvRqvdeQpm93kZpgsM2ijflS2f6opC8lrd1dID0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R+IHAxx9ICn5kZticFlLjw4Yx9j2djqeWsEZtFcbzt8vQmAoRFwGBRVEVDDSPnJi2
	 GjtLNOajbSqGbSW/wGbU7wDrOqVa7qZpUS/YGZoivF+v+FSH6LrhRGcwEB/yr2pvb9
	 NRVOg6g0t58sph5mifZz4KCIwsBtkB+vXZdNHaFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D0BF80447;
	Tue, 23 Jul 2019 16:21:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DAA5F80447; Tue, 23 Jul 2019 16:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 419DAF800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 16:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 419DAF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 07:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="344754446"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga005.jf.intel.com with ESMTP; 23 Jul 2019 07:21:43 -0700
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20190722135209.30302-1-ckeepax@opensource.cirrus.com>
 <7a6ca46b-9ca7-6c91-6aa9-d1be785c64c5@intel.com>
 <20190723081706.GL54126@ediswmail.ad.cirrus.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <026ea350-db7b-d78c-cae5-e03cf735607c@intel.com>
Date: Tue, 23 Jul 2019 16:21:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723081706.GL54126@ediswmail.ad.cirrus.com>
Content-Language: en-US
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: madera: Read device tree
 configuration
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-07-23 10:17, Charles Keepax wrote:
> On Tue, Jul 23, 2019 at 12:07:32AM +0200, Cezary Rojewski wrote:
>> On 2019-07-22 15:52, Charles Keepax wrote:
>>> +static void madera_prop_get_inmode(struct madera_priv *priv)
>>> +{
>>> +	struct madera *madera = priv->madera;
>>> +	struct madera_codec_pdata *pdata = &madera->pdata.codec;
>>> +	u32 tmp[MADERA_MAX_INPUT * MADERA_MAX_MUXED_CHANNELS];
>>> +	int n, i, in_idx, ch_idx;
>>> +
>>> +	BUILD_BUG_ON(ARRAY_SIZE(pdata->inmode) != MADERA_MAX_INPUT);
>>> +	BUILD_BUG_ON(ARRAY_SIZE(pdata->inmode[0]) != MADERA_MAX_MUXED_CHANNELS);
>>> +
>>> +	n = madera_get_variable_u32_array(madera->dev, "cirrus,inmode",
>>> +					  tmp, ARRAY_SIZE(tmp),
>>> +					  MADERA_MAX_MUXED_CHANNELS);
>>> +	if (n < 0)
>>> +		return;
>>> +
>>> +	in_idx = 0;
>>> +	ch_idx = 0;
>>> +	for (i = 0; i < n; ++i) {
>>> +		pdata->inmode[in_idx][ch_idx] = tmp[i];
>>> +
>>> +		if (++ch_idx == MADERA_MAX_MUXED_CHANNELS) {
>>> +			ch_idx = 0;
>>> +			++in_idx;
>>> +		}
>>> +	}
>>> +}
>>> +
>>> +static void madera_prop_get_pdata(struct madera_priv *priv)
>>> +{
>>> +	struct madera *madera = priv->madera;
>>> +	struct madera_codec_pdata *pdata = &madera->pdata.codec;
>>> +	u32 out_mono[ARRAY_SIZE(pdata->out_mono)];
>>> +	int i, n;
>>> +
>>> +	madera_prop_get_inmode(priv);
>>
>> Hmm, madera_get_variable_u32_array calls are not permissive within
>> madera_prop_get_inmode yet here they are. Is this intentional?
>>
> 
> Apologies but could you clarify what you mean by "not
> permissive"?
> 
> I can't see anything that would prevent the function from
> being called (indeed it builds and works), and the binding
> documentation does specify that this field can be of variable
> size.
> 
> Thanks,
> Charles

No worries. By "permissive" I described the usage of 
_get_variable_u32_array within madera_prop_get_pdata. In 
madera_prop_get_inmode you do care about the return value. In 
madera_prop_get_pdata however, you ignore all of them. From 
_get_variable_u32_array declaration, it seems function may fail.
Sometimes it's desired to be permissive, simply asking if that's 
intentional.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
