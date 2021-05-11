Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9197737AC00
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 18:33:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0992717ED;
	Tue, 11 May 2021 18:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0992717ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620750813;
	bh=EO1IZfDalGC3qZ+lhO1JESCbC0ZvO+bNicZISTYV+5o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FBqV6byaKmOyHKt/ynm3sXY4sjxcvZhbK2G86aQFe+cua6g8yBkN5e66uEWrO03Oc
	 sPHFqz7TdkesMcixBE4RNx+6bdU9+XXwE+seblxIIrFMo8yCVf6ow+hDBCb31f8B9R
	 xC8dcrYvtiBcVELJrwv15W59g80yEn0LLtDFL57c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 588CBF8016B;
	Tue, 11 May 2021 18:32:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31FDEF80163; Tue, 11 May 2021 18:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28340F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 18:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28340F800E9
IronPort-SDR: WxYTr8VatUzDkGsD1idqCDufwSM5OW1Z/mNkQo2fA3NfSttnDJu6lwKMCKMaV5GGfFpbWGFf9V
 kIdBhjlOFrDA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179080593"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="179080593"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 09:31:43 -0700
IronPort-SDR: KRxtLJn+R4q5VYaBdknj+YzPZ2VUeVy2jmNZyAZlZdMtEsxNCrbicBe8A3kCuDt5QjNxVzIy5w
 9vAvDjVMeZgA==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="537094135"
Received: from imascare-mobl.amr.corp.intel.com (HELO [10.212.18.238])
 ([10.212.18.238])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 09:31:41 -0700
Subject: Re: [PATCH 1/3] ASoC: cs35l36: Remove unneeded variable initialisation
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
References: <20210511101051.17726-1-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ae16c465-18c2-5f05-e77d-cd8d0a6dea81@linux.intel.com>
Date: Tue, 11 May 2021 11:31:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511101051.17726-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, james.schulman@cirrus.com
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



On 5/11/21 5:10 AM, Charles Keepax wrote:
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks, I rechecked with this patchset applied on top of the previous 
one, there's only one warning left:

sound/soc/codecs/cs42l56.c:1308:6: style: Variable 'ret' is reassigned a 
value before the old one has been used. [redundantAssignment]
  ret =  devm_snd_soc_register_component(&i2c_client->dev,
      ^
sound/soc/codecs/cs42l56.c:1247:6: note: ret is assigned
  ret = regmap_read(cs42l56->regmap, CS42L56_CHIP_ID_1, &reg);
      ^
sound/soc/codecs/cs42l56.c:1308:6: note: ret is overwritten
  ret =  devm_snd_soc_register_component(&i2c_client->dev,
      ^


> ---
>   sound/soc/codecs/cs35l36.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index a038bcec2d17c..db5472b10465b 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
> @@ -1156,7 +1156,7 @@ static int cs35l36_component_probe(struct snd_soc_component *component)
>   {
>   	struct cs35l36_private *cs35l36 =
>   			snd_soc_component_get_drvdata(component);
> -	int ret = 0;
> +	int ret;
>   
>   	if ((cs35l36->rev_id == CS35L36_REV_A0) && cs35l36->pdata.dcm_mode) {
>   		regmap_update_bits(cs35l36->regmap, CS35L36_BSTCVRT_DCM_CTRL,
> 
