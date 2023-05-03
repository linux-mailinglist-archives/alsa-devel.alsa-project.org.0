Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E134E6F6014
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 22:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA27147E;
	Wed,  3 May 2023 22:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA27147E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683145937;
	bh=x6TuXsBi+e+j0fZs3NL7j/c61rCAAoFK5ZoO80fhjGc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YMWlvVZEXqdb76otYcc63fzG1nV8mX9BwKiwvzcN9tR/2FMnUgaqELNwimJfgrlFs
	 65L9PzF8YywMy68HHdCO9s0rpB+8k7rfKnqGSjsFZPe+ny6LU2OzeYmi9nqBTLGal9
	 MFtDFTSQjGDTqKVd6Kefom9q2ZG54m/GOKipuqdM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F19BF8032B;
	Wed,  3 May 2023 22:31:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6828F8049E; Wed,  3 May 2023 22:31:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E985F80137
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 22:31:15 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9EFA011E2;
	Wed,  3 May 2023 22:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9EFA011E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683145873; bh=gWJE8lnnv5jZpDQtNRa9cG8GDMeXg+r56ScMI0Xfk40=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XLKZPU4nnfqhva14SXrZDCI5hHfhdR4q+JO7fWSnwAtQYHCfXkOa7eG5Mk5dFpRDO
	 vUYagzZcSobg9dS5COdwvrE9ky7/Jkd8gVa01tPe9xaKtCpm3I7O2lRRLcG2uURrHO
	 1y/n3y/xyecX0Cd64DA6YVaSmYeQ51FGqRzpqBSM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  3 May 2023 22:31:11 +0200 (CEST)
Message-ID: <bee4882a-5023-7159-6adc-b55360217857@perex.cz>
Date: Wed, 3 May 2023 22:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH alsa-lib 1/4] pcm: hw: setup explicit silencing for
 snd_pcm_drain by default
Content-Language: en-US
To: ALSA development <alsa-devel@alsa-project.org>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
References: <20230502115010.986325-1-perex@perex.cz>
 <20230502115010.986325-2-perex@perex.cz> <ZFJDhQZAiCPBpM0D@ugly>
 <ZFLB4agt4SGCuvG0@ugly>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <ZFLB4agt4SGCuvG0@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TYLY5JSRXHSQIEPB2JOSBVPYNULIPUKM
X-Message-ID-Hash: TYLY5JSRXHSQIEPB2JOSBVPYNULIPUKM
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYLY5JSRXHSQIEPB2JOSBVPYNULIPUKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03. 05. 23 22:19, Oswald Buddenhagen wrote:
> On Wed, May 03, 2023 at 01:20:37PM +0200, Oswald Buddenhagen wrote:
>> On Tue, May 02, 2023 at 01:50:07PM +0200, Jaroslav Kysela wrote:
>>> +		 * or the next period wake up)
>>> +		 */
>>> +		sw_params.silence_threshold = pcm->buffer_size;
>>> +		sw_params.silence_size = silence_size;
>>>
>> so at this point i got the thought "huh, that can exceed the buffer
>> size. is that ok?" ...
>> and yes, it is. but ...
>>
>> the kernel doesn't check silence_threshold, so user space can trigger
>> the snd_BUG_ON() in snd_pcm_playback_silence(). whoops.
>> (yes, this predates my patch.)
>> i'm not sure what the best way to deal with this is. anyway, different
>> tree, different patch.
> 
> actually, that analysis is garbage, because i didn't look at enough
> context. :}
> 
> the kernel _does_ check the values in snd_pcm_sw_params(), which means
> that silence_size exceeding silence_threshold would lead to EINVAL, and
> therefore silencing being broken. this will inevitably happen with small
> buffer sizes, where the 1/10th sec extension dominates.

Yes, I overlooked this. Thanks. Fixed in:

https://github.com/alsa-project/alsa-lib/commit/58077e2f0d896ff848f3551518b1d9fc6c97d695

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

