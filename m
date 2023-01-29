Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A067FDA2
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Jan 2023 09:26:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE1EEEAE;
	Sun, 29 Jan 2023 09:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE1EEEAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674980773;
	bh=pLizHV3VOzyjL1m4zB1zP1MXn3GWDVvQuhcDoXLvhNk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SKIeOD54xLbzepXjUwPTmBVpOvBuBW7TGCQfp76UZ3SmDmfV8TvJt6PA7qIBxbnSt
	 wq5KvhXV1sONW+pG0WwtGrGu4128fscbkv1gq18ibmkQO+eMC/hVknqjK+vhZV1ciW
	 E+U55Ik4Z1UOysZrqB575iwAlU5eZ1XUlISivlVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D8C8F8056F;
	Sun, 29 Jan 2023 09:23:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA1EF804B2; Sun, 29 Jan 2023 07:55:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34C68F80171
 for <alsa-devel@alsa-project.org>; Sun, 29 Jan 2023 07:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34C68F80171
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WSChR8rq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674975313; x=1706511313;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pLizHV3VOzyjL1m4zB1zP1MXn3GWDVvQuhcDoXLvhNk=;
 b=WSChR8rqKhaUX5cSGU2HUelaPls01LAKy2XKDWSFNWNjWuKxaKwZsPJr
 qLaAna3iER/JyyELztkEO1e6ExrnxNwauC3aXM0PCrWUs6Tis82klV8YU
 IeCTdaUSK/BwfzcCNcbXjgqP7pT4P85Qkh45aU0c7BphophdrcLGTHGyx
 gFjOIa7ETGR+KnVYjXlpJ0MTDROu0y1ki+ejDA8tn9FEZ4aopRS5dwOvZ
 QKZlVvav41vqAY1gpJjXQX3CLZKD89xwxYQSIAXPe7Ra8DEvA2bKRqrH2
 I5AGqt2d1GvAqQx5LzUas6Z8qazpqKcitI+uLmcrKzGBRplF1+y/j/toe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="327385521"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="327385521"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 22:55:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="806297526"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="806297526"
Received: from zhoufuro-mobl.ccr.corp.intel.com (HELO [10.254.211.56])
 ([10.254.211.56])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 22:55:02 -0800
Message-ID: <7c1d80b6-5db3-9955-0a67-908455bd77fa@linux.intel.com>
Date: Sun, 29 Jan 2023 14:54:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 07/22] ASoC: Add SOC USB APIs for adding an USB
 backend
To: Greg KH <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-8-quic_wcheng@quicinc.com> <Y9UiiMbJFjkzyEol@kroah.com>
Content-Language: en-US
From: Zhou Furong <furong.zhou@linux.intel.com>
In-Reply-To: <Y9UiiMbJFjkzyEol@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 29 Jan 2023 09:23:11 +0100
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



>> +void *snd_soc_usb_get_priv_data(struct device *usbdev)
>> +{
>> +	struct snd_soc_usb *ctx;
>> +
>> +	if (!usbdev)
>> +		return NULL;
> 
> How could usbdev ever be NULL?
The method is exported to public, valid check should be reasonable
as someone may call it by mistake

> 
>> +
>> +	ctx = snd_soc_find_usb_ctx(usbdev);
>> +
>> +	return ctx ? ctx->priv_data : NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_get_priv_data);
>> +

