Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD06B41B0
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:55:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D614418A0;
	Fri, 10 Mar 2023 14:54:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D614418A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678456521;
	bh=/018jJD+swS5DWH9em1WsRnDlRp8kxcRDyBj26+4y8c=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WZJWY083FfS/3RiT57yEo9dPfcN5VA85ValxlADXf11HBF47pXKADubg2XpVXmkIq
	 yB0MWUg5UBHySsQRxDVYS1YbfR7pw4aD34jYAo1CYFWJ8FNvwDhz3UWXyWxCBtJPhd
	 WsHRYGopyPnD9Y82TG6YJdLc+NHz4iP2arcvJFTI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F09A2F80236;
	Fri, 10 Mar 2023 14:54:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D0CAF8042F; Fri, 10 Mar 2023 14:54:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8530BF80093
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8530BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Xkg9y839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678456466; x=1709992466;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=/018jJD+swS5DWH9em1WsRnDlRp8kxcRDyBj26+4y8c=;
  b=Xkg9y839UzzZZWfoRb/hy44PVBgfUzY3mGBykfRkgpCfJ8tp/uv3srDu
   V+NUTcJC9Dw5/9OSrppadEsm8DsTu2h/kgWrqXYFRnXd4nD74n9uHwa35
   Mbj9q8cBMKCbSwhENJFG5EqzFT8wn057RiTHgBRfpsZLBO6soz8+ePdE3
   d6N4s4tjZLqoz9GybK4BcfMH5OX6fSWUtRHmDP3VnrHRWnfdWJ6ZtpwYr
   vlDAxWCFCXDJ8NXNWHizESQKCRo12TYcZGPztE7JjxXvYxpyF1jBejxhR
   v2yxG1rSeITh2EXQRlNDPPBI3MhejATAy7QUefJjV8566glTZPMR9NXbl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338283072"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400";
   d="scan'208";a="338283072"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 05:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="627818006"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400";
   d="scan'208";a="627818006"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 05:54:16 -0800
Message-ID: <d401dd0a-5e57-b559-09b0-3e552b8c1710@linux.intel.com>
Date: Fri, 10 Mar 2023 14:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: alsa-devel - message mangling?
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
 <167818863631.26.6699494131684260973@mailman-core.alsa-project.org>
 <1232949a-0efd-9814-5587-bb5e0417bf1d@linux.intel.com>
 <6f003598-4cae-a521-233f-2c19eb439359@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <6f003598-4cae-a521-233f-2c19eb439359@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TOSBMIPFC7P7KDD3GCQIPRRFRUUL5OZL
X-Message-ID-Hash: TOSBMIPFC7P7KDD3GCQIPRRFRUUL5OZL
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOSBMIPFC7P7KDD3GCQIPRRFRUUL5OZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/10/2023 2:36 PM, Jaroslav Kysela wrote:
> On 10. 03. 23 9:40, Amadeusz Sławiński wrote:
>> On 3/7/2023 12:30 PM, Charles Keepax via Alsa-devel wrote:
>>
>> Hi Jaroslav,
> 
> Hi,
> 
>> any chance that you can take a look at mailing list settings, it seems
>> like from few days some messages to mailing list come as "Someone via
>> Alsa-devel", like in top line, also content is attached as messages, so
>> when I clicked reply it didn't quote the email, as message body is
>> "empty", because all content is in attachment. You can also see it on
>> archives:
>> https://lore.kernel.org/alsa-devel/167843595709.26.931771458197876919@mailman-core.alsa-project.org/T/#m543a4c13e2f291684e54807a10ba638d906006de
> 
> I've turned on for the testing purposes the DMARC [1] mitigation which 
> encapsulates the original message as attachment [2] in mailman 3. The 
> original message is not mangled. You should use the attachment as the 
> source for the reply. The other mitigation option is to mangle From, but 
> I think that it's even worse for the replies.
> 
> Note that this mitigation is only for senders which have strict DMARC 
> rules (reject or quarantine) in their DNS records like mentioned 
> cirrus.com, bootlin.com etc.
> 
> It is really difficult to play nicely here. But breaking DMARC rules 
> means delivery issues and putting the outbound SMTP server to the reject 
> list (as a spam source).
> 
> If we cannot live with this settings, I can turn it off, but consider to:
> 
> 1) ask the senders with the strict DMARC to use another domain
> 2) work with the attachment (original message) for those senders
> 3) if the message is not delivered to all members, the purpose of this 
> mailing list is lost
> 
>                      Jaroslav
> 
> [1] https://dmarc.org
> [2] 
> https://docs.mailman3.org/projects/mailman/en/latest/src/mailman/handlers/docs/dmarc-mitigations.html
> 

Ah, email handling standards, that explains it. Well, I guess I have no 
problem with it, it was just bit confusing to me what is going on ;)
Thanks, for explanation!

Amadeusz
