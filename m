Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC17F72805F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 14:46:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D67B11E0;
	Thu,  8 Jun 2023 14:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D67B11E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686228407;
	bh=H1r0W9WVPHzrdGTTibYOdhubTH08ACFC40tRzw8m7V4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CzbqMu2s7FymnArRyKUaycEPuqxePwZEl1bqk4bJIgragXTMUN5nJk20di0XldK+C
	 s/tr7enW+/n0mYt5KaA08GwVHPWKlLDbvAWTTylinucoJGnIkZZXGQ9BOBHrPUij2p
	 WeOx014np2tI7PSdsMicftlM++MUCsEy2FptWB9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6107CF80494; Thu,  8 Jun 2023 14:45:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E45F80155;
	Thu,  8 Jun 2023 14:45:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68EE1F80199; Thu,  8 Jun 2023 14:45:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79833F80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 14:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79833F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RfzPmr6B
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30af86a96b4so396108f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 05:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686228324; x=1688820324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vmqGVlI9T81rCL/4f/GexWdAAvug+BIqEO8bf8jT/6U=;
        b=RfzPmr6BWjOtPOkksfKRwsz2n058AlqO66sfiRGGMz01Ym8+8ddRVr5CW3CHckVTa7
         TaXVxFurMC4eP4so+GDZuHKrJlyuxN4Fw1MWkcz71gagOIizaQkMAXEAXkNkR+WE7X3i
         N70wV59iGNLcptDlYJmj2DL/eVR4y8uQ1AzyRz1RVJRDK6StCKzpv+0DULcesZDfi7zt
         bA83MPnUB7dAzLT8YfT+wdhZ2nNjotHCC4KFL4iOppTJbrCRsynn+tg5aOdWUfAGRhnq
         ZJwFIu3uDlGS6UZ1ro1ijVl3v0tZUyoWtBRmcLxqr6ZXXL7qI7LCtaa8zQHoOeax2RwF
         MQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228324; x=1688820324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmqGVlI9T81rCL/4f/GexWdAAvug+BIqEO8bf8jT/6U=;
        b=aykisOmr6g3HJZXRp89yGDJzEOiQ4FBl13sTiq8T1g4hdVSXqK4rzjhYsh0yLLogss
         zL6RMGtDEhSSvAa9jnPSEzCXGlCm2mv+bPWTO848ls53JRntZ/6WF2pMxxBURBJcSXwH
         Hw/T/J0qGZMMJ+d7dbp9KxNooI6QQ2uqXvjgWHVVnS5xlapiG0ZLuw+Kq0FGhv1f3sTY
         k3mFA6vg1WMJLch8vkZf3lO77GW9CEN8sO8j9zY20wXNKwWlEVUr196XKVo5HCwJiqOR
         QMKPZvjnSWYjWl/tKGB1vqe2tpQHaQNEz2LLJwRPvA+yFwol7aN3mgYYa9oXUVdaZqjv
         QZEA==
X-Gm-Message-State: AC+VfDzPX/6fssnx0gJZ6Ra8vc9F82FnDKBDjJIk0pMHVIbO2BKC2UdZ
	8cv+4zszmvd/QtpU2WJKgf5uzw==
X-Google-Smtp-Source: 
 ACHHUZ4wR43oT1yBtFul56orr6mcjmTg2AX+BWhQbvb3vgPRJnsnAKGJSS3YTeHlq4VJVzJtJvQbsg==
X-Received: by 2002:adf:e592:0:b0:307:9db3:432a with SMTP id
 l18-20020adfe592000000b003079db3432amr6901113wrm.42.1686228324291;
        Thu, 08 Jun 2023 05:45:24 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 b10-20020adfe30a000000b00300aee6c9cesm1523197wrj.20.2023.06.08.05.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 05:45:23 -0700 (PDT)
Message-ID: <a236e2f6-0fd7-f814-f68d-ae0a3e3dfc92@linaro.org>
Date: Thu, 8 Jun 2023 13:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/4] soundwire: qcom: stablity fixes
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: vkoul@kernel.org, andersson@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
 <ZH2l-UbMyLi5Uwph@hovoldconsulting.com>
 <5d6bcc6a-151e-ac21-2dd2-f72a91f562d5@linaro.org>
 <ZIGpYPrNYDlkRQIf@hovoldconsulting.com>
 <ZIHMMFtuDtvdpFAZ@hovoldconsulting.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZIHMMFtuDtvdpFAZ@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UMAPMIY7QCOCHQ74OYHEQNQ7O6FK4LFW
X-Message-ID-Hash: UMAPMIY7QCOCHQ74OYHEQNQ7O6FK4LFW
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMAPMIY7QCOCHQ74OYHEQNQ7O6FK4LFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08/06/2023 13:40, Johan Hovold wrote:
> On Thu, Jun 08, 2023 at 12:11:45PM +0200, Johan Hovold wrote:
>> On Wed, Jun 07, 2023 at 10:36:40AM +0100, Srinivas Kandagatla wrote:
> 
>> No, not yet, but I just triggered the above once more after not having
>> seen with my latest -rc5 branch for a while (e.g. 20 reboots?):
>>
>> [   11.430131] qcom-soundwire 3210000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
>> [   11.431741] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
>> [   11.431933] wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
>> [   11.435406] qcom-soundwire 3330000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
>> [   11.449286] qcom-soundwire 3250000.soundwire-controller: Qualcomm Soundwire controller v1.6.0 Registered
>> [   11.450632] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
>> [   11.453155] wsa883x-codec sdw:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
>> [   11.456511] wsa883x-codec sdw:0:0217:0202:00:2: WSA883X Version 1_1, Variant: WSA8835_V2
>> [   11.562623] q6apm-dai 3000000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 23
>> [   11.585766] snd-sc8280xp sound: ASoC: adding FE link failed
>> [   11.585872] snd-sc8280xp sound: ASoC: topology: could not load header: -517
>> [   11.586021] qcom-apm gprsvc:service:2:1: tplg component load failed-517
>> [   11.586100] qcom-apm gprsvc:service:2:1: ASoC: error at snd_soc_component_probe on gprsvc:service:2:1: -22
>> [   11.586530] snd-sc8280xp sound: ASoC: failed to instantiate card -22
>> [   11.591831] snd-sc8280xp: probe of sound failed with error -22
>>
>> I don't think I've ever seen it before dropping the runtime PM patch as
>> you did in v2, and I hit it twice fairly quickly after dropping it. And
>> now again.
>>
>> I'm not saying that the runtime PM patch is necessarily correct, and
>> perhaps it is just changes in timing that lead to the above, but we
>> definitely have a bug here.
> 
> I searched my notes and realised that I have seen this once also with
> the runtime pm patch. So the fact that happened to see it more often
> after dropping it is likely due to changes in timing.
> 
> Looking at the above log it seems like we hit a probe deferral somewhere
> as some resource is not available yet, and this is eventually turned
> into a hard failure that breaks audio as the error is propagated up the
> stack.

I was looking at this too, And I think this change should help..
Not tried it though


----------------------------------->cut<----------------------------------
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index cdabfe2feceb..b57532d6b163 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -543,7 +543,7 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
  		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
  			if (sdw_compare_devid(slave, id) == 0) {
  				qcom_swrm_set_slave_dev_num(bus, slave, i);
-				if (!slave->prop.simple_clk_stop_capable)
+				if (slave->prop.clk_stop_mode1)
  					ctrl->clock_stop_not_supported = true;

  				found = true;
diff --git a/sound/soc/qcom/qdsp6/topology.c 
b/sound/soc/qcom/qdsp6/topology.c
index cccc59b570b9..3c50a560bc84 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1276,10 +1276,8 @@ int audioreach_tplg_init(struct snd_soc_component 
*component)
  	}

  	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
-	if (ret < 0) {
+	if (ret < 0)
  		dev_err(dev, "tplg component load failed%d\n", ret);
-		ret = -EINVAL;
-	}

  	release_firmware(fw);
  err:

----------------------------------->cut<----------------------------------

> 
> Johan
