Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28595689275
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 09:38:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34A1D823;
	Fri,  3 Feb 2023 09:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34A1D823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675413535;
	bh=fXCSzLNB/nHCY6Ax/FH+cDfYlohm0NZEIuSsNaeAatw=;
	h=Date:To:References:Subject:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sKaLnVr5Ir7SddMsmJo9Cy9OLKwaurb2vlnwC5A1Zy6wWiBbnMhNrqWTWs0wWkzhq
	 7UsArAtVq5Y/GkmrWB+Sg1R3qf9A9/NV58JgjRA+hsJOe8JL00AVumpGJb1YAt9ONq
	 Jg65ruQ1pyuO8PAHcvm7beB1pSHE785t1CrGH7JQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A936F80423;
	Fri,  3 Feb 2023 09:37:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6E4FF804C2; Thu,  2 Feb 2023 03:13:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90375F800E3
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 03:13:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90375F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CMH1KQae
Received: by mail-qt1-x829.google.com with SMTP id v17so549615qto.3
 for <alsa-devel@alsa-project.org>; Wed, 01 Feb 2023 18:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmp+gLg2mSwFYsxZZpssJ7RfilX35F9BxrqBwqKEOfM=;
 b=CMH1KQaeR1zBMkTvorqv6ltZsHsXpyIxEnJIO+Wi88DESKoLf5MC9TsmRskvy4/IVc
 mGU1VWpCFb2D4Kz+Na9vZEF9uQR6CdUTI8EFbNY/JPy/f/JbNOPmv106EEEZREc6Oc77
 8lwBAEgzxjDKaH1JpUNwOWvRhVTLIHP/Yd4KkbRJNLQFXMFXy5E0aLZQxHmbgZYGZygA
 tVxbZOhsow7KI6vaiEJHor6+QfAbSzs0VoGbmbKtia/wHorQj42Cs9Si/TEut2uolTTl
 nK9dxUwoZBmvfvz3UKAimUrnOlYJsCYq2NT5GQtFMPKT4TaOtAjPCQU3NfnioTRHanic
 rerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mmp+gLg2mSwFYsxZZpssJ7RfilX35F9BxrqBwqKEOfM=;
 b=DeALPLIMFwxkC1odCo4s23jcWz5A4K21MJweIe3z8vBwWlVoTtrqWYQfexzrgg6vuI
 Kxf+ut9QeGZJc5hb99IGYStdUvhzc2QUNurFK+v6JOz9oHPakHVwhlVhxssaOzpN34fv
 bFApbDeqFIhqqrqDHlrgXCkhGPjLw7JrHsJy38yT2OvTZGGwDR2wcN9X0t7lnZdbVvOC
 VX0xeE7aTExiy3DzqpZkZTZsgSyTRJyOtp5qpTbC/0HaU4l+Vn8+XggHlqoys3z0dKzw
 5stgOxTX6rzGiNEVRifs6NZMndrd0CESDPKVOHnuYCP9w1NbjG2JZwFpRpm7W5wJov6y
 rmIg==
X-Gm-Message-State: AO0yUKWfQ+uEQjO+EmApIvqPnGxzyifXumjdimctc++nukutxNQLFkkH
 HRxbSf9uqA1PWzNuUKUSNyc=
X-Google-Smtp-Source: AK7set/NhmMODJ/+csynPebZ9of6l0csjZa+SU2VJG6GGm64zASG23DDTN79qA1xq1PXjeP78iRLKw==
X-Received: by 2002:ac8:5ac5:0:b0:3b8:6c80:c113 with SMTP id
 d5-20020ac85ac5000000b003b86c80c113mr8779770qtd.66.1675303980154; 
 Wed, 01 Feb 2023 18:13:00 -0800 (PST)
Received: from [192.168.0.162] (cpe-74-69-166-246.stny.res.rr.com.
 [74.69.166.246]) by smtp.gmail.com with ESMTPSA id
 p3-20020ae9f303000000b006fa43e139b5sm13188164qkg.59.2023.02.01.18.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 18:12:59 -0800 (PST)
Message-ID: <f72469f6-60bd-6bcf-be73-a804a1193e54@gmail.com>
Date: Wed, 1 Feb 2023 21:12:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: faenkhauser@gmail.com
References: <20220811152923.10143-1-faenkhauser@gmail.com>
Subject: Re: [PATCH] Sound: pci/hda: Add quirk for HP Envy x360 ey0xxx
Content-Language: en-US
From: Albert Tseng <tsengalb99@gmail.com>
In-Reply-To: <20220811152923.10143-1-faenkhauser@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 03 Feb 2023 09:37:52 +0100
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
Cc: alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 rf@opensource.cirrus.com, james.schulman@cirrus.com, david.rhodes@cirrus.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Apologies if this thread is already dead, but I came across this thread 
while debugging an audio issue with my HP 865 G9 (bugzilla report 
https://bugzilla.kernel.org/show_bug.cgi?id=216927). I think the issue 
with my machine is the same and related to the cirrus logic driver code, 
as suggested by Jaroslav (apparently also on this thread). The bug 
appears to have been fixed in 6.2rc6, but not in 6.1.8. Can someone add 
whatever got fixed to 6.1 since 6.1 is the stable kernel? This is also 
my first time using the kernel mailing list so I hope I am not emailing 
1000 people or doing something wrong like not opening a new thread.

