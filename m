Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B85EC67769B
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 09:45:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE0A541F1;
	Mon, 23 Jan 2023 09:44:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE0A541F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674463534;
	bh=eqVGynfL97OO1n988llKh7vB44FeetFzBHX8sEAl2x0=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dXZnqAqXUvt8R8OJGHpy7JG9rTchn6NUT/lqFZ/xkdnbcAIbCu5gSFakCZTsMEc2q
	 hjIP4coWDKVE3TrI7toN+qyc9Z4BO+ez7O4f2H+ygC4Coo2MVSJt2F7xoxe5rI1WAv
	 80TvObxO8f0w6GF4KGlvOsm39b4Yq4Y+Hr7Pyl1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B00A2F8057A;
	Mon, 23 Jan 2023 09:42:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40880F8026D; Fri, 20 Jan 2023 23:49:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99A24F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 23:49:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A24F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SJ7Ngi78
Received: by mail-wm1-x32a.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so4698664wms.4
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 14:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-id:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TBg2ZGSLJCHCe4StnuS4Rf2XAsBlx+T2xK8kBvKv+5I=;
 b=SJ7Ngi78KdWr+dxt92Brtb7mMmMsDrdUtcVnXudTPfxsCxacHixF+sq839NSklew4L
 GzGHgchDYxFk0G5Aax4ap0njAnvnowwwFrbRZY0iOLvW8bDJiso09wqMc6s/6B8ab5ZJ
 J45WrKTY1F0Ha7DZSBpIvTopG7OorcjJ3xNyQ1KBDG7NalXcVbaZMlt3YM19syr7fYnm
 6Sani86aF9mm2Qe0S1SUv0LJ6t/0xtgsGcndZfKI52r9uLzob9AefVKTJ3uKBaOzz06C
 To94OMUcIUNQ4NZTmRnyJFv1Q6nH9EarFCEeT46nMi3tTBkkVhs3SiQvAWEyKuqlcncf
 CxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-id:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBg2ZGSLJCHCe4StnuS4Rf2XAsBlx+T2xK8kBvKv+5I=;
 b=3bx7nLEo1c5oWCZKtG0bsKuz8qUKeq0MaMgy+hI5j//oEzTgioFY4Zzqka8TgmKKUW
 Xfpy83f+NpUmVoBW4NYSlkm/lKKDVj/AkjBcvoBoz9PsDlennh8lMdEnJaLC3rvs8TMV
 eoDwSQ6C9XPg7IbxcL6pQvbrGWxtDDq/D9rTKO6kC6+/iOpu792Lvdl+abxmkln0eH8e
 IH6LHh6E+3ztvDqhE/v61F+VdNmX/ZDwHpFKMzu4+Hg0VKBWEJNVYcYhcOm5NsQg5WKF
 K7LoVB74raPgawb9JU3s1DgwBI5sTdAA/0mQdUThxaajvzcSAbNLu2Cvkr8UxsJMjQUo
 k42g==
X-Gm-Message-State: AFqh2korEBXtcEUEYGVClRZsd6xikOH3Ow88/qm73poNx3k/hP8C6IWy
 FnHJi8bWIO2TFRMqtPHFdI4=
X-Google-Smtp-Source: AMrXdXtn/n4mw/1xYuM53NkndS8FqUOcqZ1AW1INz0Q8ktjH/XJksS8iILG8ofDkgnklJ9s1+mi1/g==
X-Received: by 2002:a05:600c:444b:b0:3da:fd06:a6f1 with SMTP id
 v11-20020a05600c444b00b003dafd06a6f1mr15392053wmn.31.1674254955845; 
 Fri, 20 Jan 2023 14:49:15 -0800 (PST)
Received: from fedora.36 ([78.10.206.44]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b003d9aa76dc6asm4974827wmq.0.2023.01.20.14.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 14:49:15 -0800 (PST)
Date: Fri, 20 Jan 2023 23:49:10 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <mchl.grzlk@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] dt-bindings: sound: audio-graph-port: Add capture and
 playback
In-Reply-To: <87lelxlt18.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <c6b1ad16-894d-e9a4-1fd1-cc94ec11df7@student.agh.edu.pl>
References: <20230120011744.550701-1-mchl.grzlk@gmail.com>
 <87lelxlt18.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-ID: <5b8b88f9-a34b-dacf-ccb7-9b5973b44de3@student.agh.edu.pl>
X-Mailman-Approved-At: Mon, 23 Jan 2023 09:42:43 +0100
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 =?ISO-8859-2?Q?Micha=B3_Grzelak?= <mchl.grzlk@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Kuninori,

Thanks for quick reply.

On Fri, 20 Jan 2023, Kuninori Morimoto wrote:

>
> Hi Micha³
>
> Thank you for your patch
>
>> Running 'make DT_SCHEMA_FILES=renesas,rsnd.yaml dt_binding_check'
>> gives following warning:
>>
>> bindings/sound/renesas,rsnd.example.dtb:
>> sound@ec500000: port:endpoint: Unevaluated properties are not allowed
>> ('capture', 'playback' were unexpected)
>>         From schema: bindings/sound/renesas,rsnd.yaml
>
> Now I'm posting the patch for it.
>
> 	https://lore.kernel.org/r/87358hj2ub.wl-kuninori.morimoto.gx@renesas.com

Thanks also for pointing that out, I should have given more time to
searching for existing patches.

Best regards,
Micha³
