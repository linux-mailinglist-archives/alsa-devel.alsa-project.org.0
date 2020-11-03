Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 949452A4AFB
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 17:16:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9410E16BA;
	Tue,  3 Nov 2020 17:16:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9410E16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604420210;
	bh=H8dK8NMlMPRcrltYizqp9CkSxPKkMdx8/zwCDPO0/HM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cjS8DsPzpLZKgqtiU//l90UBclXYuEAHqOSz7a3TXBymcUEyOk+ESVt2xJSeWCg5j
	 +8ba13Fj/j4u8JRHUaosgF+pFO774JBgwyNi2bjEvnyO48WQLfBBI4h2yjKQkc1vZi
	 PI4sO1AdfCwtxoN4eOoD4LTiV/HQCTyT2VCJ2oCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1807EF804B3;
	Tue,  3 Nov 2020 17:15:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A93C6F80272; Tue,  3 Nov 2020 17:15:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88F0DF80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 17:15:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88F0DF80083
IronPort-SDR: 9hZtBgb2vv+67f2Sa1hOpFwY2pQY6xCUM+6iGQzvcohsvlhHOSYWgrpcOSAro831sxyW8M68/N
 pFrxoVPqIl+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="169185045"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="169185045"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 08:14:58 -0800
IronPort-SDR: O2DhVTMd6e778exoN8PgT9cKVFe6JJwL6CN3YdTAaIhxsJYlVAmSvFH6r9usWVHX086eEYTB2a
 iKok52xZcMAA==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="528532324"
Received: from ctanriov-mobl1.amr.corp.intel.com (HELO [10.212.114.78])
 ([10.212.114.78])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 08:14:58 -0800
Subject: Re: [PATCH v2 3/6] ASoC: codecs: lpass-wsa-macro: add dapm widgets
 and route
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
 <20201029110829.16425-4-srinivas.kandagatla@linaro.org>
 <3300f31e-28d1-becf-41e7-814b38082dcb@linux.intel.com>
 <b21abfab-108e-50f4-f905-5d9d0fc5168b@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <798ac8de-2d04-9966-6104-9a676730f44c@linux.intel.com>
Date: Tue, 3 Nov 2020 09:51:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b21abfab-108e-50f4-f905-5d9d0fc5168b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



>>> +static bool wsa_macro_adie_lb(struct snd_soc_component *component,
>>> +                  int interp_idx)
>>> +{
>>> +    u16 int_mux_cfg0 = 0, int_mux_cfg1 = 0;
>>
>> these inits are ignored
>>
>>> +    u8 int_mux_cfg0_val = 0, int_mux_cfg1_val = 0;
>>
>> these as well
>>
>>> +    u8 int_n_inp0 = 0, int_n_inp1 = 0, int_n_inp2 = 0;
>>
>> and these are also ignored.
>>
> Yes, these are ignored, I should have removed the unnecessary 
> initialization!
> It would have been nice if sparse could catch such errors!
> 
> are you using tool to catch these?

make W=1 and cppcheck.

"
Run cppcheck on this sort of code:

cppcheck --platform=unix32 --force --max-configs=1024 --inconclusive
--enable=all --suppress=variableScope sound/soc/codecs/lpass-wsa-macro.c
"
