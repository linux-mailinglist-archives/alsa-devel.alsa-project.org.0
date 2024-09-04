Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB096AFA5
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 06:11:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5428A868;
	Wed,  4 Sep 2024 06:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5428A868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725423106;
	bh=cZ0+WnAbadAz+U3QcvyDL8L866ErHNN4WkzgIUNH5IA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZeGaVrKI9gWFqUvND2IxfYFi24Luy+TQaFQw36OLNlDZRbxEg8fufzv3JDLf2MY5q
	 MDn7t8Du1ydWvYOPdrf4fWhFm7DgtzyirFIft6chQyVpMN4cxKy/CUED056V79LOM5
	 C7MprR4/dv1zLdcA9ipznJybzGgSpd/WEV6cGE98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED224F805B4; Wed,  4 Sep 2024 06:11:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15DE5F804FC;
	Wed,  4 Sep 2024 06:11:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F17AF80199; Wed,  4 Sep 2024 06:11:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFD8FF80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 06:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD8FF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=wFlJHFyL
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-7d4fa972cbeso747339a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Sep 2024 21:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725423065; x=1726027865;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RmBH1X6Hy8Ny7eEgPGP8rtFggO6Gx2dLIra+M316Z0=;
        b=wFlJHFyLyX3rqzY/cckWfcU/eBOV8qUSqJDIU0lNk7YzY3sDJpOt2Jb4aMNLrn4ruu
         doHf6eZiPio9VFFgnDbH4Ula0LNUgrtyNI1B2FBmugnt6XBgYnzHR6aZQFrLZ+3Icuez
         Bp1Ux4/B2CnPxfIGNSQDt1Y3HQSwJkyUzi/zXNoiZUmkTTbw81ReR3bSJ5oQpEIeljTk
         wsSezx+IO/WdK9sDyMqktMsbGRvAj7DnigBviAl50JxDRANsHS6xQab2m2hR+e9br1SC
         9xB+1s0SUEymq/1zNQaxqcD738x2vmyPtRGQo3wysHvH6e7h7zl1wcE17c5BBzF6t5DG
         TFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725423065; x=1726027865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RmBH1X6Hy8Ny7eEgPGP8rtFggO6Gx2dLIra+M316Z0=;
        b=fUhPhG1OXsnOf8sWfA7SzEUhH3ZbaLdindNjpGIe1V/izM03jfuqAKkWJNSCBlpHIb
         52ivHbgnaW0idqIzGIY5aWT+cuag55mgmcPcpw7s9YoOy8AWGyQsahHA/Kacn+Gh/D5g
         ZuB9YRcEWnx3kPw43KnXbkWMkckehJLua8s4qNIj7eqYFMK9AQN2T9YXGv3FnmEsGVoE
         Kq7L+RgSocph2OoZB7nLAe8Nat5TU9mF1Z41REKPLDtNjOWlUNdCcS//70JlHqg+uiaa
         XoYszNkt2wOkHMoRJITFfzoQjf5jivvt/gn8FIJwF+jHE//XWmLkrsj5TuoJJ0X77ZVG
         NgIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiWWZjpNukYXx81L2z7J50fKP/GLXDQK92lXCvFdqmWTPlsj8rXvvTarGKifTdRHnS4zaBkX0XD9r2@alsa-project.org
X-Gm-Message-State: AOJu0Yx8quHjFJ4zhzlTrkjru4C04Fjf0eSaHKcN5fzXH9tthB/kaEwK
	C+pKmSVirAnwz33t5m5gzgHUrnHlzC3oFMGkM/+Rgz+JmiXyciEfUrrqrX7fNLZ1Z+Qj6aU86mc
	s0RUORyOFx1wpXyfbgFrTibwXlik+yDPcwYU4
X-Google-Smtp-Source: 
 AGHT+IHy4mkCxTnlDdfRTGmoRH1KEN5Mwh3pT5x35vBXHapXCxmrlcRmijPvQkHj15C9J0FJOAgThW0avjYZ2quG07Q=
X-Received: by 2002:a17:902:db08:b0:205:8b9e:964b with SMTP id
 d9443c01a7336-2058b9e9afamr98711815ad.39.1725423064609; Tue, 03 Sep 2024
 21:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <878qwaoa10.wl-kuninori.morimoto.gx@renesas.com>
 <877cbuo9l6.wl-kuninori.morimoto.gx@renesas.com>
 <20240902070746.GA11534@pendragon.ideasonboard.com>
 <CAMuHMdXqRQz22rjPs8LG__ow-B50bhgXQ14jkfM0HSFn99F_2Q@mail.gmail.com>
 <87y149bg8v.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUVqojaz=bRSWV-SRqcZ9zEpw2=ooFaBFqJq6k_C0RYQw@mail.gmail.com>
 <87bk148g3v.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bk148g3v.wl-kuninori.morimoto.gx@renesas.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 3 Sep 2024 21:10:28 -0700
Message-ID: 
 <CAGETcx8nhCQRJdP3s+ZLuBFoneb4kA4yf93_JB8mNrfc9KE+iA@mail.gmail.com>
Subject: Re: Qestion: of property has dead-lock to call .probe()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
	Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
	Laurent <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YP5KFUNUR3LORQPPD6AVQV7TNPX6SPKA
X-Message-ID-Hash: YP5KFUNUR3LORQPPD6AVQV7TNPX6SPKA
X-MailFrom: saravanak@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YP5KFUNUR3LORQPPD6AVQV7TNPX6SPKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 3, 2024 at 4:36=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Saravana, Rob
> Cc Mark/ALSA-ML, Geert, Laurent
>
> I got dead-lock issue on drivers/of/property.c to call .probe()
> I'm now using v6.11-rc5.
>
> I'm using 3 devices, and these are connected via OF-Graph.
> These are connected like this so far. Let's call it as [Style-A]
>
> [Style-A]
>         +---+  +---+
>         |(A)+--+   |
>         +-+-+  |   |
>           |    |(B)|
>         +-+-+  |   |
>         |(C)+--+   |
>         +---+  +---+
>
> These are using port/endpoint to connect. It works well for now,
> no issue I have so far.
>
> (B) is connector for (A)-(C) data, thus, (A) and (C) should
> be probed first, and (B) needs probe later
> (For ALSA member, this (B) is Audio Graph Card2).
>
> Here, (A)-(C) can connect directly for some data.
> Now it is using both data connection (=3D (A)-(B)-(C) and (A)-(C))
>
> Now, I want to disconnect (A)-(C) connection, like below
> Let's call it as [Style-B]
>
> [Style-B]
>         +---+  +---+
>         |(A)+--+   |
>         +---+  |   |
>                |(B)|
>         +---+  |   |
>         |(C)+--+   |
>         +---+  +---+
>
> Then, it seems dead-lock happen.
>
> In my debug, it seems...
>         - (B) is handled as supplier for (A).
>         - (B) probe() is called, but it needs (A) info which is not yet
>           probed. So it returns -EPROBE_DEFER.
>         - Because (B) is not probed, (A) probe() never called
>
> In [Style-A], it seems __fwnode_link_cycle() is called for (A)-(B)
> connection, so the dead-lock will be solved.
> But it is not called for [Style-B]. Because of that (B) is always handled
> as supplier for (A).
>
> If I used below patch, and use "non-supplier" property on (B), this
> dead-lock issue was solved. But I know this is not a good solution.
>
> I think it is very normal connection, not super special.
> How can I solve this issue on correct way ? Or how can I indicate you
> my issue more detail ?
> I can add debug patch and test it if you can indicate it to me.

Kinda swamped, so skimmed your diagram. Looks like you are making up a
"non-supplier" property?

Anyway, I solved this recently in a general way. Use
"post-init-providers" property in the node of "A" and point it to "B".
This tells fw_devlink that B is not needed for A to probe.

So, NACK to this patch, but hope my response helps.

-Saravana

>
> -----------------------------------------------
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index def152c61049..2f08210c2ea4 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1502,11 +1502,22 @@ static struct device_node *parse_remote_endpoint(=
struct device_node *np,
>                                                  const char *prop_name,
>                                                  int index)
>  {
> +       struct device_node *node;
> +
>         /* Return NULL for index > 0 to signify end of remote-endpoints. =
*/
>         if (index > 0 || strcmp(prop_name, "remote-endpoint"))
>                 return NULL;
>
> -       return of_graph_get_remote_port_parent(np);
> +       node =3D of_graph_get_remote_port_parent(np);
> +
> +       /*
> +        * There is clearly non-supplier node which is connected via "rem=
ote-endpoint".
> +        * Ignore it, otherwise dead-lock might occur
> +        */
> +       if (of_property_present(node, "non-supplier"))
> +               return NULL;
> +
> +       return node;
>  }
> -----------------------------------------------
>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
