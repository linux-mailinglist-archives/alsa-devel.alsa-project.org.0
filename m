Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EB8702CAD
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 14:28:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 335DD84A;
	Mon, 15 May 2023 14:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 335DD84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684153707;
	bh=Eh9XwYrbp8NW/KR7kEnb2GSgGQevGSjiwOFWE5nJNfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AU/rgYqpSGoCO83na4PnCWT+lGZ5n5PbFEwOblnZxQNjU0HZ/JP3QYVJZECUSXwAj
	 0XJmfT6W15ToTmvd9ywxISb0IRqXpxoAzfwVY+eUNHfZ27MBkRC6ZDkOaLMdzjMvcR
	 LNe+x7Yhc91M/S9JtRVzFw3Kx7ahditc3KZQJK0w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AD7BF805B0; Mon, 15 May 2023 14:26:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3485F805AA;
	Mon, 15 May 2023 14:26:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E67CF802E8; Sun, 14 May 2023 12:09:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2B94F8016A
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 12:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2B94F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=WgvlRw8u
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50c079eb705so2851914a12.1
        for <alsa-devel@alsa-project.org>;
 Sun, 14 May 2023 03:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684058936; x=1686650936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ie9tiZWx0j0qso2N+/tHJUjGfMip0OumDCuv0l96kj8=;
        b=WgvlRw8uZZxNk/hWPkNXit0p+MkX0JNCyI7Vzy7yJY+OsvwTCNXVGUhs1wWVsvUX21
         nXH/U8P2buAlKk/QRUpPPlXwZ6xNSMN6Ie6c/P8o7+U+TpPiXqw9cHPQjufjQaP2oH5Z
         2ogGG7SzwoCreXK0QZcfN8Vr/5p2DNlO0+EVTN8Ri05js0mr8AoxvR+iELR9nMwsZ3eX
         0jkh0jQ8AObDYgvzUWBh6JBIamixp/DoIj7xEXrCplepepbHVOhrtVNq1s6jsaAgz15J
         6aPjtcKnlAQO8J9gHOrvTKum+grQaRuZiDsoQgJQpFsjgWYa2kNloSVD3NMmgFoodj29
         ZKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684058936; x=1686650936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie9tiZWx0j0qso2N+/tHJUjGfMip0OumDCuv0l96kj8=;
        b=dkYfY4svbFPGRzWuFptYz3vk+DToTEjxIVwYRA1APb2fGum3a6X6n1WVsdUwRomqyA
         DpyUpTaxlWgNcAC+talu6mlTFDihWWzldnz7rjfEV1nScRXkIi4yNAasFj+Ni0uHe+nN
         j90gxjL/cZKe4LETsbeXnEi2v3Lvhc6nAtqYMtpr3/HNz2HwCZRvdjUH+PEQsWEoJVQy
         /4grTNfxIuEVb1yF0CmxY5Et42U/mih9W+hkR3pgTA9DEfbuI5BCXEGmViBpV8xjqLpV
         08p4d/6m37DASlbF5w7/QjIzYTWP+JTXRX5hG5GXjBpMHl6FJL/qH+hhuFMp8+H/ncIP
         1AAQ==
X-Gm-Message-State: AC+VfDzbOMFzjDAS3GoTDJiUtk7VNX+mrjb6HccgQBjiNCxq9YZasYJ+
	RljNgNwyEvh65M88wvIlYxs=
X-Google-Smtp-Source: 
 ACHHUZ4Z1zF+di5vZ/CeRoQGRNuzAxlt2n8nf6jgaD78i3qq9gsh34Uq5xlThiik/oqT/cdFYmGmmg==
X-Received: by 2002:a05:6402:2742:b0:50d:9ba4:52dc with SMTP id
 z2-20020a056402274200b0050d9ba452dcmr4516415edd.0.1684058935703;
        Sun, 14 May 2023 03:08:55 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.94.55])
        by smtp.gmail.com with ESMTPSA id
 v17-20020aa7cd51000000b0050daa883545sm5679306edw.64.2023.05.14.03.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 03:08:55 -0700 (PDT)
Message-ID: <6f6d09b3-39e7-58b6-221f-6276d3ce213a@gmail.com>
Date: Sun, 14 May 2023 14:08:53 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] ALSA: Implement the new virtual driver
To: Takashi Iwai <tiwai@suse.de>
Cc: corbet@lwn.net, akpm@linux-foundation.org, perex@perex.cz,
 tiwai@suse.com, broonie@kernel.org, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org, himadrispandya@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
 <20230513202037.158777-2-ivan.orlov0322@gmail.com>
 <878rdr8e5f.wl-tiwai@suse.de>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <878rdr8e5f.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 43WERGMOFEZ2QP4UTKZHS6BLPYCZEA44
X-Message-ID-Hash: 43WERGMOFEZ2QP4UTKZHS6BLPYCZEA44
X-Mailman-Approved-At: Mon, 15 May 2023 12:26:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43WERGMOFEZ2QP4UTKZHS6BLPYCZEA44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/14/23 13:18, Takashi Iwai wrote:
> The idea is interesting, and it's a definitely good thing to have.
> 
> I wonder, though, whether it could be better provided as an extention
> to the existing snd-dummy driver.  The advantage of extending
> snd-dummy driver would be that it already supports different formats,
> etc.  OTOH, if we create an individual driver, the pro side is the
> simpleness of the code.
> 
> I'm inclined to go with a separate driver, but I'm open about this.
> Maybe Jaroslav and Mark have some opinions?
> 
> About this patch set: the driver name should be a bit more specific,
> as this isn't a generic virtual driver that is used for general
> purpose but it's only for testing.  And it's only for testing PCM.
> So, a name like snd-test-pcm would be more appropriate, IMO.
> 
> And, we want the coverage of different formats, channels, rates and
> accesses (interleaved vs non-interleaved).  How can we extend somehow
> more for that?
> 
> 
> thanks,
> 
> Takashi

Hello Takashi! Thank you for your reply. I fully agree with the naming 
issue, and I'll change it in the future versions of the patch set in 
case we choose to have it as a separate driver. I also prefer this 
option because in my opinion the use cases of these drivers are a little 
bit different. Also, I believe I can extend the driver to support 
different formats, channels and accesses in the near future.

Additionally, implementing these changes would be a perfect task for the 
end of the Linux Kernel Mentorship program I'm going through :) However, 
I'm open to other views on this, and I'm ready to move the functionality 
from my driver to the snd-dummy in case we prefer this option.

Thanks again for considering my changes!

Kind regards,
Ivan Orlov.

