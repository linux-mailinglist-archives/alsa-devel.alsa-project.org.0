Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA68933D13
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 14:38:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07AFA857;
	Wed, 17 Jul 2024 14:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07AFA857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721219929;
	bh=4ICfKJXxsSRQ/sPCmW5uCAAgzvEwln8qzmxDLijW5Mg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gwE77tUh55Voz/UizK7EgovCnMV+qyoxQf9Pig8qX6jzQIZZeqTQB94o7vy/nkdmf
	 hsyoa06/sfx3bSwTNxVE9vLWtfnhTZyNfodzFtObq60ujBFRdL0QsFTRUGlMYa4vL9
	 bHrlaRmW3DKSLC7vAKbyPwOthK5ZGAcmXhc1/2+E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7420F8059F; Wed, 17 Jul 2024 14:38:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86696F805AD;
	Wed, 17 Jul 2024 14:38:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B215FF8026D; Wed, 17 Jul 2024 14:36:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from smtp51.i.mail.ru (smtp51.i.mail.ru [95.163.41.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8FB1F8013D
	for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2024 14:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8FB1F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=list.ru header.i=@list.ru header.a=rsa-sha256
 header.s=mail4 header.b=LY9WBEoj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=3DxAhlNjeJkBHbjvrPN7I9Vnx4htlrPauqcKJWhSFRs=; t=1721219472; x=1721309472;
	b=LY9WBEojUGrSdi9ZhV3TBEOQYL67CX6UhHFJ+rA2FmM8emwhRrA3BPzrahOV3rG/0bdMIPshP9P
	Oxnm5ArJkghfS1DysyzEjUJGQgUcCDuZILUUrhWUKYZokZtw3oIngScqXJPic84a7f5Bz+Rv6b0rp
	8Ch25VohCwNpjw0N/VH05+s4dungSdJ68V0R5YXtLX+1UAvTqFfxgbpGFJq4EIk0X7J/u+cB8oerM
	C/7eB32RWoUauqbPrcOu/G+61LLBrqStAGTw2J4OF3U3QuFK5fERmsyjuwC4ldjfQDYaZKRJ9mbol
	W0Og8nQeEv6DUwrwej42+wrZ76idqEqd0gnw==;
Received: by smtp51.i.mail.ru with esmtpa (envelope-from
 <steshenko_sergei@list.ru>)
	id 1sU3oK-00000009SGj-0LOJ; Wed, 17 Jul 2024 15:31:09 +0300
Message-ID: <748e1318-bc21-4280-9d1b-efd661403cdc@list.ru>
Date: Wed, 17 Jul 2024 15:31:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Alsa-user] Help on specifying 'chmap' in asound.conf
To: Takashi Iwai <tiwai@suse.de>, Xinhui Zhou <zxinhui2001@gmail.com>
Cc: alsa-user@lists.sourceforge.net, alsa-devel@alsa-project.org,
 tiwai@suse.com, perex@perex.cz
References: <mailman.0.1673946668.16556.alsa-user@lists.sourceforge.net>
 <0c99f6e0-c2f8-bc30-be10-314708382345@sc-riebe.de>
 <c21f506a-255e-5885-7dde-f9716187536e@sc-riebe.de>
 <CABsjGHLPYa26noDK3LDR_9EDxjXRZ9E5cEDAAyYnCEiuCPYWTg@mail.gmail.com>
 <87le21z5wp.wl-tiwai@suse.de>
Content-Language: en-US
From: Sergei Steshenko <steshenko_sergei@list.ru>
In-Reply-To: <87le21z5wp.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp51.i.mail.ru;
 auth=pass smtp.auth=steshenko_sergei@list.ru
 smtp.mailfrom=steshenko_sergei@list.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD9C20EA97715EAF8CF261DE58FDD52B03C7DD4FE1047A23CA7182A05F53808504080500E088DC586155D1BE6A8D71B10A531734AF64BDA05284C8CC3C3F0886F6F7A43E2483F2A4E25
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7059B0D8AC717918AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FA81DCE0280C9CC68F08D7030A58E5AD1A62830130A00468AEEEE3FBA3A834EE7353EFBB55337566F63B4C43CA7D47ADB697AEFFFA519DBEAEE1F6711B20F49D2E42793D2EED1D438EEF46B7454FC60B9742502CCDD46D0D249797B4B1AC1449F6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249A5DF9383870C0FEDCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C921661749BA6B97735AD76BF5943A59ECC8941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C0CD26667FDE013BC17B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050F140C956E756FBB7A098B145E00970258B3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BB662CFBDBA8F60F475ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 
 0D63561A33F958A50E1CE74811C411D05002B1117B3ED696BADB49C34807B88072305013E4AE841E823CB91A9FED034534781492E4B8EEAD69BF13FED57427F1BDAD6C7F3747799A
X-C8649E89: 
 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3441661D6226BE8C31D12F510BA39133A6E7158B2147084D2C16D817278BA6CABCEEDB1D4924A66B9B1D7E09C32AA3244CDCE3F5188A343A27E70D6F05539DA95A3D2630EBA4228D73EA455F16B58544A2339EE7E191543B94A5AE236DF995FB5979C9CD2E3F02A782212F6D535BB50B1AC4D96C1575A2E6E243082AE146A756F3
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioja4l/EuHNSk5kjekK48Ujtg==
X-Mailru-Sender: 
 08FC42C9FB184A05FBED555004DFF6EABAA124E8CF139807B951B70A5BD4BD8E11A27135B226F626CAD474F3A20BCBC279247B9C4B206ECDFB559BB5D741EB967D00CE147F79BDAC6F53C80213D1719C67EA787935ED9F1B
X-Mras: Ok
Message-ID-Hash: IPUBKJSR3HE4TSKEIA2GABKH6RSXOPLU
X-Message-ID-Hash: IPUBKJSR3HE4TSKEIA2GABKH6RSXOPLU
X-MailFrom: steshenko_sergei@list.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPUBKJSR3HE4TSKEIA2GABKH6RSXOPLU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For that matter, which ALSA source files do the parsing ? From my 
old/distant memories, ALSA is silent about mistakes made by user when 
the user provides various configuration files. So, there must be a way 
to resolve the issue of silent ignoring of user mistakes.

A possible temporary solution would be to "trace" (e.g. by inserting 
diagnostic print statements) parsing of provided by user configuration 
files, and to implement this one has to know where to insert the 
diagnostic print statements, and that's why I'm asking the question.

--Sergei.

On 7/16/24 18:57, Takashi Iwai wrote:
> On Tue, 16 Jul 2024 08:09:21 +0200,
> Xinhui Zhou wrote:
>> Dear all,
>>
>>     I am having a question regarding how to specify 'champ' for a
>> plugin.  I do not see any examples of this. I tried many ways to
>> specify but failed.
>>
>>    As indicated by the link below,   I can specify the MAP as a string
>> array.   Can someone provide one example on how exactly this    [chmap
>> MAP]  can be specified?
>>
>> "
>> pcm.name {
>>          type cras
>>      [chmap MAP]     # Provide channel maps; MAP is a string array
>> }
>> "
>> https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_plugins.html
>>
>>
>> I can something like these, but none of these work for me.
>>
>> chmap LFE
>> chmap "LFE"
>> chmap FR,FL,LFE
>> champ "FR,FL,LFE"
> You need to define a composite array, e.g. pass like
>      chmap [ "FL,FR" ]
> instead.
>
> For multiple configurations, you can put more items such as
>      chmap [ "FC" "FL,FR" "FL,FR,FC,LFE" ]
>
>
> HTH,
>
> Takashi
>
>
> _______________________________________________
> Alsa-user mailing list
> Alsa-user@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/alsa-user
