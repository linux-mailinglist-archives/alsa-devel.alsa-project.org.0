Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D795D71A39F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56249A4B;
	Thu,  1 Jun 2023 18:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56249A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685635484;
	bh=TirXeNXcSGysUY1U4xKNK2JClyX6eQNssWqvDCuEisI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YSubT2eCz55WVoplyQYEoEXIWYzcvGu4TaUXRDgX99lEGqAyu5EbRG/zxIr0XTbc1
	 BiqdoNB2k/itcGDQCkEdq4BTrQRokKoGgOrsjK4wf5gKj0PZrMafBz/kYSVG8xbPMH
	 F0tuwfXnrBSuy4hZRpMY8WyVFvGsokUNmqwEBTJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB108F8059F; Thu,  1 Jun 2023 18:02:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF07F80588;
	Thu,  1 Jun 2023 18:02:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D421DF80249; Fri, 26 May 2023 21:25:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from domac.alu.hr (domac.alu.unizg.hr [161.53.235.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0B22F80053
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 21:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0B22F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.a=rsa-sha256
 header.s=mail header.b=xs9isNSu;
	dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr
 header.a=rsa-sha256 header.s=mail header.b=0lmiMCYu
Received: from localhost (localhost [127.0.0.1])
	by domac.alu.hr (Postfix) with ESMTP id 28AC360204;
	Fri, 26 May 2023 21:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1685129104; bh=TirXeNXcSGysUY1U4xKNK2JClyX6eQNssWqvDCuEisI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xs9isNSuXwNC3VD26JSpsggNq7hTq8uqKje9Olf9r6lM3aAps7x85uuB9nBfAB9B7
	 t1uoB10GnW38VwABiY1vUhgB9IRWMlWgD/Gu+vjcMnLrTO0u0hiUEEgx7hm2p9JK36
	 fbwDHrKBGPGuFRcCabwDOVyg498bdu9lia/5qCZmi/g/Nyj+gcmYgyj0CLsQnkLgo6
	 XYHxbiSjFpw7ElgbjbNOqsYfPM4M7XFD8nZ7Iq0ZF9zd7k/+hJu3d3gvcYWds52tK0
	 C9z3svxc/VW3c1jy7nR2dm4gouDBMiUic6ZWrcVBu5mC6tVx0ppawIVN6TMggzDGR+
	 vYfE1X62Y+7SA==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
	by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9xZedwACIwM; Fri, 26 May 2023 21:25:02 +0200 (CEST)
Received: from [192.168.1.6] (unknown [77.237.113.62])
	by domac.alu.hr (Postfix) with ESMTPSA id 9403D60203;
	Fri, 26 May 2023 21:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1685129102; bh=TirXeNXcSGysUY1U4xKNK2JClyX6eQNssWqvDCuEisI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0lmiMCYu2YDUtravjkwoTBqXhgjbhmCZsWkhQe5smuIlPTvCelwf02jGYMRDdvpyI
	 VE5fd4LY0kxYQjYEUcvLLfVjdDQ+Q2CCnMQ9sheuyVaerVrb0nr91Fi1HYxuDZTmQE
	 maCzKbWIx0O/1kY/YdMqhyE9hOaqLdeeC7EfT2VrEEman1n3RLjncTUTVebu1Fm37X
	 BoMqq8KJ2D9KtN1BRVMDAxO1YQkmLrrx8vfDKEqTFCs4gtord8s0EsDfCTJpibbio5
	 sECRViI+RRsQIjRQtjbJAW5bHH8562yQzxMxI/D2AFE8JkKUB84bDlpuMOa8cQ+Dvx
	 U+ZQZJVks0g5g==
Message-ID: <00be4091-0119-c9dd-c632-079d2943c5ca@alu.unizg.hr>
Date: Fri, 26 May 2023 21:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/1] selftests: alsa: pcm-test: Fix compiler warnings
 about the format
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
References: <20230524191528.13203-1-mirsad.todorovac@alu.unizg.hr>
 <9c82296b-4682-49e7-8302-bd678135f1b4@sirena.org.uk>
From: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <9c82296b-4682-49e7-8302-bd678135f1b4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: mirsad.todorovac@alu.unizg.hr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VAPWUBNNI35YVK2SBRS54BJGICBNRLKR
X-Message-ID-Hash: VAPWUBNNI35YVK2SBRS54BJGICBNRLKR
X-Mailman-Approved-At: Thu, 01 Jun 2023 16:02:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAPWUBNNI35YVK2SBRS54BJGICBNRLKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/25/23 11:22, Mark Brown wrote:
> On Wed, May 24, 2023 at 09:15:29PM +0200, Mirsad Goran Todorovac wrote:
>> GCC 11.3.0 issues warnings in this module about wrong sizes of format
>> specifiers:
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks,
Mirsad
