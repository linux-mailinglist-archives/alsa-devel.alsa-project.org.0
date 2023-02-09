Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD3690EF7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 18:14:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7891E207;
	Thu,  9 Feb 2023 18:13:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7891E207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675962844;
	bh=wyLCp50yFMc9ZMhy+nsTukzXOuX2uRkJLZdmKWpCxkE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NP8MjPwAiXvl/42fxqZVLAZ/bUeTfaKg5dP4iqTC2JUViUg/5A6Ztg9Bxx6Lb5Ein
	 6ygKUu6GaNj3TicAP+hnZAcwHHlpiJYag+IvbDEhqAQaIgPsKMLymucEY1T3lWVzQt
	 uPvA5NlOXITu5L1WncuSVeVzV/GctsezwKRvfnX4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3920F800B8;
	Thu,  9 Feb 2023 18:13:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD8BAF800E4; Thu,  9 Feb 2023 18:13:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5189F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 18:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5189F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GJo9WWtu
Received: by mail-wm1-x32d.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so2076737wms.1
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 09:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5GPjhCbZ3et3vqmx7KmUEtwowI7Pr60n/KjlExkXei0=;
        b=GJo9WWtu1ZnJB6gV0M9juIZhKwkPObGpPjeXCInDvaP2nsf1ITStqZGZQQV+ZjiWti
         aAccOoexxwUkoZ9158tN7UCC5Q6zmuoBhcaDtUEtx5qoO+U8OL8EJl98oqXjOyrXPfI7
         hoD0I3pY/CyPkL8L67Iknvof2RekRnJ5O5yh8JIoDKKWIcPAHPbf170L0+LiV55OP2j8
         HUsSNYTCkPeyNROVSNBRw74cgYSJMoWBk2fLKNNMPPfncsewgYenOfRIsRMbabGYt4hE
         PwwYd1JXThN3vxJ60GglkM12+5w9y8tXt4sGS6igxVyrw4d56+pGK7bHtn55VQpGelS8
         10vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5GPjhCbZ3et3vqmx7KmUEtwowI7Pr60n/KjlExkXei0=;
        b=h2y+DNZqk9cEA8QO85V/JHQZI7YmL12jEDgjHflEYXL83k5R9V+HWUo75gwHgjDneW
         KhLpESe/dH+DO/efq5JbGCVaxNUac4BRKWeCbp1dM7aDzvZROSUWJCJHloYVnZ8t/pkD
         tWqG1uB0Fa/TfDp95sFtqIyegAtETJT2qaGjOyWcx2rlCRZ+N6Da6fFNnr8xUe4AZA2E
         k0cSHPBgvhWBnOFc9ShaT8819cdKNdj7N7MOllC2aKdi4LMecoqsOTt0QLcEjxvbSFuW
         JRUSFwCEDpzveJF/qixpaL7PTTsh6xZKIUDvC2EkX3MOd4imGd0JN7hsW+K2HS/b1IIR
         1arw==
X-Gm-Message-State: AO0yUKXEsainebiUC+tt292IiIMNYj4k/MFD+TQg+ntpKRFmQ89uol0M
	MqENxOMWHqT9hsFWMiOBirBSsQ==
X-Google-Smtp-Source: 
 AK7set/40YxIru/Sg20+glOLA2RW2JIQUYkNBT2cAqfx+XkBJi1WBwHaILu2BCyKH2Dxn4lAVSA0Vg==
X-Received: by 2002:a05:600c:308a:b0:3dc:43a0:83bb with SMTP id
 g10-20020a05600c308a00b003dc43a083bbmr10774960wmn.3.1675962778601;
        Thu, 09 Feb 2023 09:12:58 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 j7-20020a5d6047000000b002c53a89f042sm1526667wrt.30.2023.02.09.09.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 09:12:57 -0800 (PST)
Message-ID: <8fb08ac8-13ae-cd87-869e-34af894407e8@linaro.org>
Date: Thu, 9 Feb 2023 17:12:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] soundwire: qcom: wait for fifo to be empty before
 suspend
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
 <20230209131336.18252-4-srinivas.kandagatla@linaro.org>
 <dbec6aab-6456-72b3-39b6-3490dfdf083c@linux.intel.com>
 <a1d79008-3ec4-d7b5-12b5-ea5c6c5a8370@linaro.org>
 <f956351e-de37-062b-c02e-5cbdf9a3bdfd@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <f956351e-de37-062b-c02e-5cbdf9a3bdfd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: J3TCZEFUQNOVLLOSSU2HYKRW55S7PE56
X-Message-ID-Hash: J3TCZEFUQNOVLLOSSU2HYKRW55S7PE56
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3TCZEFUQNOVLLOSSU2HYKRW55S7PE56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09/02/2023 16:33, Pierre-Louis Bossart wrote:
> 
> 
> On 2/9/23 09:52, Srinivas Kandagatla wrote:
>>
>>
>> On 09/02/2023 15:23, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 2/9/23 07:13, Srinivas Kandagatla wrote:
>>>> Wait for Fifo to be empty before going to suspend or before bank
>>>> switch happens. Just to make sure that all the reads/writes are done.
>>>
>>> For the suspend case that seems like a valid approach, but for bank
>>> switch don't we already have a bus->msg_lock mutex that will prevent the
>>> bank switch command from being sent before the other commands are
>>> handled?
>>
>> All read/writes are fifo based, so writes could be still pending.
> 
> I am not following. The bank switch happens with this function, where a
> mutex is taken.
> 
> int sdw_transfer(struct sdw_bus *bus, struct sdw_msg *msg)
> {
> 	int ret;
> 
> 	mutex_lock(&bus->msg_lock);
> 
> 	ret = sdw_transfer_unlocked(bus, msg);

Qualcomm controller uses fifo to read/write, so return after writing to 
fifo might not always indicate that write is completed.

Qcom Soundwire controller do not have any synchronous interrupt 
mechanism to indicate write complete.

--srini


> 
> 	mutex_unlock(&bus->msg_lock);
> 
> 	return ret;
> }
> 
> The transfer_unlocked is synchronous and waits for the command response
> to be available.
> 
> In other words, there's both a mutual exclusion and a synchronous
> behavior, so not sure how commands *before* the bank switch could be
> pending?

