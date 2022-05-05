Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785251BFDC
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 14:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D251735;
	Thu,  5 May 2022 14:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D251735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651755070;
	bh=jd65rAs8a/ATH9LZ6RCZ7lAehXIe9PB5fhMw90TMHjI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kjPZ35rQapqYkw0lwh24eaj0b6lbE2gbcwObE0bCR1SfDjAxuucpdMVkDV/7liDl3
	 kXzN/T0J9x1AygC6oNNlkzJiZAXx/O4KtPOBOu7juyBsJints42c2VkITHRtMvHFe/
	 AEEdw0jFLyQ+nYHpU3ta/dq7Pu+B3+NlBtMYcirM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CAA3F8049C;
	Thu,  5 May 2022 14:50:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35303F8016B; Thu,  5 May 2022 14:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BCD6F800BF
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 14:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BCD6F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="BuvJZcgl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YS2uydLg"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5F5733200956;
 Thu,  5 May 2022 08:49:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 05 May 2022 08:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1651754995; x=1651841395; bh=fq
 ogm4h0VIwQs2hcNJnVx1Sj3qVREIdwePdscUo3x3Q=; b=BuvJZcglAKehGfHZRH
 thTA08I7TTHWi/XET6DKgSwx4KjOAIyCQ/UdntvMpyIZwvMQQ11IqMPj5tcdBuv0
 20tDM/jSGpV5F+cxDL96G4BcQFbj2cIjNKEuJbyA0WE9nMbK8B5H3yO7XSOb1U1A
 tOom4neqUM3Dh/FE681wgPwq8//Mh7BHTdUcp5GwfOFXgUpT9Hp+hwqvdTX+U24i
 SB2dY+2TsGW+HYMrQHKRd8aAQoA2W6BtgAMq63vb5lR2PFumXCAWkS7+xzLLoO+l
 3Vf/cIdoNfrMUWTBLd3oBBwF/XzbJPKWJ4c9bTPNEdMUK4/gBHIZJBD/qU0enbpv
 n9oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651754995; x=
 1651841395; bh=fqogm4h0VIwQs2hcNJnVx1Sj3qVREIdwePdscUo3x3Q=; b=Y
 S2uydLg0fRqkN3SWY15aTsEhb289jzqR1tfOWKdtRYhKQ/NsK7vQ+u81BnprOonY
 6Nb4iFGuAGLqpM70MYlgSlqbguacmK/7Ij7L7Hgi+4hwcuxloBlmzlT223yjUFa8
 C5Mml/8rDsr1S7yWPI+zk08zUCMxeurbo1So3i1+YWUSkuLQeiByQclDqXzioPiL
 c+LFrKaxb0zd4sZn3HEoCYKuscitznyf0Nr/LZOagk7aYT7W2BX79wZ/f5cyRUFu
 tqhV3XWREbW4g5Wl9tlC8HqEndHKkAaU0hIfZAztUJ3sb+RNuxBXzVwfFtQp40AC
 SGtO+RNW6hXH+41vBNOaQ==
X-ME-Sender: <xms:88dzYkUz-TqGHpY5NPdf0csfeeBkQyWCjhfmQYtlL9Ez71DTJ53LTg>
 <xme:88dzYonuvGEuS8ssAV8__KR_6dfjmuQw3prtYUOT2hsl_Iwr8owabB4VhMN48YFqu
 o7wakwzks4gFJefvjk>
X-ME-Received: <xmr:88dzYob-bAeC7MmB-HnhrjoIeECXskbdj7x5ay1QbLIhEyD4R4SIvKeHxHhNgAbJWZnc1Lw2CivuBDGz91_HX0iRfBqR0EZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhfgggtuggj
 fgesthdtredttdervdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceooh
 dqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhep
 lefgveejfeduhefgteevvdehtdfhiefggfehvdegiefgvefhffefieduveeiueeinecuff
 homhgrihhnpehgihhthhhusgdrtghomhdpghhithhhuhgsrdhiohenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
 hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:88dzYjUvgDKDPnR5K6snk4BUEIbrRDiYQtRBmeVWXnT7hnZQfvU7Wg>
 <xmx:88dzYul7HWLXPVCsflS_qgPM2jmLUtTulfrG7Fu9EufkqJeWZZvsiw>
 <xmx:88dzYoe0kw3js-hBJ8g2J6xVWW8MLd-fJyb2iirB9YLQ4MP87ZHWAw>
 <xmx:88dzYisM2Pjwf33gi9TgHLDIyDewbdFCVAqNHqW4htl7uGAj2d7Tzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 May 2022 08:49:54 -0400 (EDT)
Date: Thu, 5 May 2022 21:49:52 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Request for setup of new repositories
Message-ID: <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: <YmagC3V3t0k84k9A@workstation>
 <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
 <YmfZxmfv5dfgdYG1@workstation> <YmtNgqfFREYKZM6t@workstation>
 <YnO4A43EUdnG0b7n@workstation>
 <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Thu, May 5, 2022, at 21:10, Jaroslav Kysela wrote:
> On 05. 05. 22 13:41, Takashi Sakamoto wrote:
>> Hi Jaroslav,
>> 
>> On Fri, Apr 29, 2022 at 11:29:22AM +0900, Takashi Sakamoto wrote:
>>> Hi Jaroslav,
>>>
>>> On Tue, Apr 26, 2022 at 08:38:46PM +0900, Takashi Sakamoto wrote:
>>>> Hi Jaroslav,
>>>>
>>>> On Tue, Apr 26, 2022 at 09:23:38AM +0200, Jaroslav Kysela wrote:
>>>>> On 25. 04. 22 15:20, Takashi Sakamoto wrote:
>>>>>> Hi Jaroslav, Iwai-san,
>>>>>>
>>>>>> Thanks for your maintenance for alsa-project organization in github.com.
>>>>>> Currently I'd like to add new three repositories under the organization
>>>>>> as a part of my work for ALSA firewire stack.
>>>>>>
>>>>>> I've been maintaining libhinawa since 2014 and recently realized that
>>>>>> current design is not necessarily convenient since it includes two
>>>>>> functions; operation to Linux FireWire cdev, and operation of ALSA HwDep
>>>>>> cdev. Currently I'm working for new library to split the latter operation.
>>>>>> Then I'd like you to setup below repositories:
>>>>>>
>>>>>>    * 'libhitaki'
>>>>>>    * 'libhitaki-doc'
>>>>>>    * 'hitaki-rs'
>>>>>>
>>>>>> The library itself and its Rust binding are utilized by
>>>>>> 'snd-firewire-ctl-services'[2], thus it's preferable to register them under
>>>>>> 'GObject Introspection' Team.
>>>>>>
>>>>>> Thanks for your assist for my work.
>>>>>
>>>>> Hi Takashi,
>>>>>
>>>>> All is set on github. Let me know, if you need other changes.
>>>>
>>>> Thanks for your arrangement. At present, I have no with for additional
>>>> changes.
>>>>
>>>> However for settings of libhinwa repository, I'd like you to change URL
>>>> of documentation. We can see it in right side of top page.
>>>>
>>>>   * https://github.com/alsa-project/libhinawa
>>>>
>>>> Currently it points to 'https://takaswie.github.io/libhinawa-docs/'
>>>> while it should be 'https://alsa-project.github.io/libhinawa-docs/'.
>>>
>>> Additionally today I push documentation for libhitaki into the added
>>> repository:
>>>
>>>   * https://github.com/alsa-project/libhitaki-doc
>>>   
>>> I expect Github Pages makes association between the content and publish
>>> URI:
>>>
>>>   * https://alsa-project.github.io/libhitaki-doc
>>>
>>> However it doesn't. I think we have missing configuration. Would I ask
>>> you to change settings following to this instruction?
>>>
>>> https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site
>> 
>> Would I request the above to you, please?
>
> Appologize, I already set this last Friday, but forgot to send the 
> confirmation e-mail.
>
> https://alsa-project.github.io/libhitaki-doc/

OK. I can see the published pages.

Besides, please fix the URL in "about" information of libhinawa repository.
You probable see a wheel icon in right side of top page. When clicking it,
you can see "website" field has "https://takaswie.github.io/libhinawa-docs/".
Please replace it with "https://alsa-project.github.io/libhinawa-docs/".

> There's possibility to have the doc and sources in one repo (I can specify doc 
> subtree). It may reduce the repositories, but I suspect that your preference 
> is to have things separated.

At present I prefer separated pages from source since the pages can be
generated from the source, however as you say the inclusive way is worth
to reduce repository maintained by the project. I test the idea later in
my libhinoko repository. When it looks well, I'll request you for
configuration change.


Thanks

Takashi Sakamoto
