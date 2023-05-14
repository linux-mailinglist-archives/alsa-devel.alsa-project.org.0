Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7B4702CAF
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 14:28:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 289A0823;
	Mon, 15 May 2023 14:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 289A0823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684153723;
	bh=3yluCXcosZrevjCC2JlavkuAfksHzxF5e6l5bTTacBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DgGJURvYTiWgSmdSjMHmOJouPknXJQbDLVFE+HMGG4JWkJo8+ic5JcJbErkOn5NjZ
	 UAnrAFy0777BaCLaXLNDr+dcsYS+a1xjh2Yu8qyvG6IA3nRLozxreJPdtndzWO6asl
	 L1JYYY6U7JLpiy114iKmMZ+PJS/o/e4VO8nzlKxI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C7F6F805BA; Mon, 15 May 2023 14:26:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93B60F805BA;
	Mon, 15 May 2023 14:26:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9D4CF80272; Sun, 14 May 2023 12:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8FE8F80087
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 12:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8FE8F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=iz+yyxzR
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-504d149839bso2668029a12.1
        for <alsa-devel@alsa-project.org>;
 Sun, 14 May 2023 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684059130; x=1686651130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yluCXcosZrevjCC2JlavkuAfksHzxF5e6l5bTTacBE=;
        b=iz+yyxzRQDLWnoppst1CEwUOmQtrnR+WlvFqDNxHCGjAIeYBxb6qPPyCwACmFvCMsC
         Uyay+Ka36Nybojkh+aNRCqbV3TtPsOyOys25ywg1hMUdPmR2syoQ798Rxs539vYqN85R
         dPEsGL6CYoLfnmNV3lfNftCjnKh5hBzTby0ZGcS3dlt90oaWJqGVnsvzZUmdOiBAhGcx
         cH0+uEO+9igr+IDSq85yTogMKAWP1Judjc/QeWoubOiltGwdbvQx+esnEgsuLyComVPu
         FRS19XpGr1KieeWX8+jraAcOzfBXfZh/EurqECNC853AdiNfIXOyuTn+Wm3pQXS2i+vK
         HOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684059130; x=1686651130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yluCXcosZrevjCC2JlavkuAfksHzxF5e6l5bTTacBE=;
        b=LOXCzW0z7SMQ2soPN0BHpN1z235OPWt3e2Wa0NT2tS12uug651BHr6X4eDjpkUxsNv
         qNiv6EOP+mhSKC/oJ8h4oMvjVY5j15XPY3zeayxpmMSyVdDTeT4JNyGtkhdpVuEHRr3Q
         CBAakksFmHUWcZJ3AO3lB77v8Qe0NkS3weqWQXcNnmSGSwO5o+2bOJC9Y1O50itoiHff
         sPbBVzytrjSVJBj1mGAEnFDXZT4mKut4g6YQvN6z2VR9YuKzNkYjxdxwTp/LtHuXMlYz
         6ErBV2RNV/Ty3zH8kyOzMGqp0xaOK1qEPRcVVG8Mp1G9ggeWYTI6k6VdfJs15lOzMTwq
         vx8A==
X-Gm-Message-State: AC+VfDzjLlTT7Vlrp2oq/HsB75WhEpYNGeJc0fNM+2zYNkxQQOj8WUUZ
	RJS7GRfQb7VquTKeG2ogfOE=
X-Google-Smtp-Source: 
 ACHHUZ53jcFiyqFVZaWmZ6BG5QzdtkqPc0CsOZ7DLrne5HaLi/baHvYx5HM2X79dfK8omAPCsAoDUg==
X-Received: by 2002:a17:906:5185:b0:94e:d5d7:67eb with SMTP id
 y5-20020a170906518500b0094ed5d767ebmr22162527ejk.5.1684059129775;
        Sun, 14 May 2023 03:12:09 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.94.55])
        by smtp.gmail.com with ESMTPSA id
 v16-20020a056402185000b0050cc4461fc5sm5617797edy.92.2023.05.14.03.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 03:12:09 -0700 (PDT)
Message-ID: <1c4ab661-580c-caf5-f4c5-5a959b410ccb@gmail.com>
Date: Sun, 14 May 2023 14:12:07 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] docs: admin-guide: add valsa driver documentation
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: corbet@lwn.net, akpm@linux-foundation.org, perex@perex.cz,
 tiwai@suse.com, broonie@kernel.org, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org, himadrispandya@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
 <877ctb8e0p.wl-tiwai@suse.de>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <877ctb8e0p.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7EZ7KMSCTYVQSX52P3YNPE3QJTBTF6SN
X-Message-ID-Hash: 7EZ7KMSCTYVQSX52P3YNPE3QJTBTF6SN
X-Mailman-Approved-At: Mon, 15 May 2023 12:26:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EZ7KMSCTYVQSX52P3YNPE3QJTBTF6SN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/14/23 13:21, Takashi Iwai wrote:
> We have already subdirectories for the sound stuff
> (Documentation/sound/*), and this should go to there, I suppose
> (unless there is somewhere dedicated for each selftest scenario).

Alright, I'll move the documentation to the sound subfolder. Thank you!

Kind regards,
Ivan Orlov.
