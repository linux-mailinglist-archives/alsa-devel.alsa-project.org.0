Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5D850DB9
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 08:11:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2669182C;
	Mon, 12 Feb 2024 08:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2669182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707721865;
	bh=lj8or7ggdJKR9iXDKz21o2V4MlB+Zx4S208R6fznus0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ovA6yyzRbzgSNGeXwJRYkwdEibD52XBtGjiRyPxzsBKf4tVhZj7y3pRWGHka03zu/
	 O2DoD7D2E28vDJAPsJmPejXPm6dnLm+yUC/LierDBNbYjcN+YFQzR5zAfuCkLXto26
	 Bo+yFXcanO3mB0aH8lmsj5R1V3VjVVxlt8L+ES0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33031F80587; Mon, 12 Feb 2024 08:10:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D52F805A0;
	Mon, 12 Feb 2024 08:10:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47D2DF80238; Mon, 12 Feb 2024 08:09:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 866EFF8015B
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 08:09:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 866EFF8015B
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a3832ef7726so316205266b.0
        for <alsa-devel@alsa-project.org>;
 Sun, 11 Feb 2024 23:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707721760; x=1708326560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oQwdcuaPgD/6a3Qyiq6Up5TUTtBy+clzjlSb/4KKug=;
        b=H1mMGo4LabCkpigTTBFDgrgY9fC/dBmZMA/id8LZJo4S3peHuHmMaU63jbeESgSfAA
         5DzOT4dEGYKqC/K/iFXzXlX6nE4QrpaY0OR4W5M4osafhawnINMsjMuLE4+Yzvh+2L67
         9LH51Yb28rmgBeiabBA/Jk7gZMjV9ww7MGv9GHf6B1880N2A38f1HLWHH42/3yRVMBAJ
         ihVzgXTGhZfqvc56YCVO6kfnsbJvaD0XNtkycAPJKq8GH+0bl6MsciRq6AsQhcTlennD
         0y3GrwWKBl3qQpJU/m8Hvxi3SmSqD0NkEO3PEBN2hgby0wt1OuuJRAt0jY6AVY/4yicx
         IS4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMzcgpRpBk4LkiSrE382TIbSXtx0RdBCOJMR4qMx0Lv4Y55OZemv4Mm3CyMQUS/MMW4IFg1R/lQjgw5S5CDWwSlOQXUYVgi/XNhow=
X-Gm-Message-State: AOJu0YwZuWovDw5o6YJDenCmo7kyEOBMH/3FUIM0I4D90GOo7HQ45npU
	M0T9lnYzbLaYvfxr5wgV7U+Ox37t9r0Ldw3rWmE55Acjf2r4yPI+
X-Google-Smtp-Source: 
 AGHT+IHedEWJoOAdlpNfWpSkXIqYj9kZfAdQq1FG4PUyadjjt2AVqxpfV+Ma2fNddcbA5kN9F+nRHg==
X-Received: by 2002:a17:906:abcc:b0:a3c:c311:9 with SMTP id
 kq12-20020a170906abcc00b00a3cc3110009mr436285ejb.72.1707721760612;
        Sun, 11 Feb 2024 23:09:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUleGVnhcJS2ioXX5L8pT8BcU6eMlSRt5YvVqlu8u/8Qguy2B+HlaSU3sqVZ1fMak5/bga4fQnYI+0oCPpR9kMkEFq98Euyt5JIge04GAgr9cfwSMPW9uXoPtON46Zf2BEOtDUIOIcTp7i+IpSH+okSAH81lESaaXgdgbpT+LOcBXBSr4p1ZKvIDckhaEa34oeBwgQ2JttbTbC9l6Chs6gWp6IMg1OtetrKaQViWVjOtJc0afzmZbOLoOzaQPPZsNHMmt+b2Byy4GEfsHgILG/YsK8ZCi/MPfdjqkSKxG+ezq4k7nocejSw/s+zYJSrXLZ/dbVxE3P1/0yB3Klu9hg8IXdsvXPxRkqfPu8mLrM3HCnkKKP6gmctyVgJ8m6O/aEcWfnGMlGa2LSWeBHZdkHlmoo0
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id
 rg8-20020a1709076b8800b00a38a2fa2d4bsm3560483ejc.45.2024.02.11.23.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 23:09:19 -0800 (PST)
Message-ID: <b912a534-f56b-4bc9-a704-4430e0743f60@kernel.org>
Date: Mon, 12 Feb 2024 08:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sound: drivers: fix typo 'reguest' to 'request'
Content-Language: en-US
To: Yinchuan Guo <guoych37@mail2.sysu.edu.cn>, linux-kernel@vger.kernel.org
Cc: lee.jones@linaro.org, james.smart@broadcom.com,
 dick.kennedy@broadcom.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
References: <20240212065014.3696356-1-guoych37@mail2.sysu.edu.cn>
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20240212065014.3696356-1-guoych37@mail2.sysu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4HUSEVJIEMNSRX7SE5YKNW5AR5UXBIUA
X-Message-ID-Hash: 4HUSEVJIEMNSRX7SE5YKNW5AR5UXBIUA
X-MailFrom: jirislaby@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HUSEVJIEMNSRX7SE5YKNW5AR5UXBIUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12. 02. 24, 7:50, Yinchuan Guo wrote:
> This patch fixes a widespread spelling mistake of the word "request"
> (incorrectly spelled as "reguest") across multiple files.
> 
> Signed-off-by: Yinchuan Guo <guoych37@mail2.sysu.edu.cn>
> ---
>   drivers/mfd/da9063-irq.c      | 2 +-
>   drivers/scsi/lpfc/lpfc_sli.c  | 2 +-
>   drivers/tty/serial/max310x.c  | 2 +-
>   drivers/tty/serial/sccnxp.c   | 2 +-

Again, these have nothing to do with sound.

-- 
js
suse labs

