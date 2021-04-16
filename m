Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7CF362591
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 311B416C3;
	Fri, 16 Apr 2021 18:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 311B416C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618590097;
	bh=gRfwOpIt6yXPsLAcEWOYj+qLmCbJoBzdZLwWMWOMuOw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kZUfaz4ygF1ocUvk6dKX1U2SxhqWNxOqftT1KNVFL6vUl1G07EDKHkfqm3rTaR+bQ
	 xsTdV2+BknEUngE/Kp0ErKAOOCEa5B7JRppQUQ61Ho7Z1lxLVG6IniEATCwAXHbnr1
	 zbQZmW+BgumvDFvHDnT96EIcJcK6aRQEe+ZrAlxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E0D5F80128;
	Fri, 16 Apr 2021 18:20:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4219AF8025B; Fri, 16 Apr 2021 18:20:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EEC0F80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EEC0F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KZThd+lk"
Received: by mail-ej1-x62b.google.com with SMTP id r12so42987225ejr.5
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3IBxP8h64PJc3/V8H3EN4zk80xLmIeXZ6iopeVB3+qQ=;
 b=KZThd+lkmDnKnDAdlvvPikGw7/InuDtrnYheTKoJAn9sBcJMgxYjuGepqD8cWjR8UD
 y7T/vjWqthQ2MnwCVwZO+xWB+lxQvTgZtqruMOpxRdahjlWpurh9fVKxdzt7H4nKuOfs
 I/h5dCHnXqUhs4wct62suX2Pseix0AI9cP8ZftwrSfXJVGKYDYZ3n2cXQskvsp56KNzJ
 ivsH2HjU5wvgCehLxHX/UTIs1/PIjxX0tdiqVZwEnsxb5s1rdByhvBv/oluX/MqPti9A
 n/SSZsCfZH3LPb8/54dV+nKPXQaWDp+885Zzp42uR7svrQd941pwfaNhndA4/tA0xRY0
 EXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3IBxP8h64PJc3/V8H3EN4zk80xLmIeXZ6iopeVB3+qQ=;
 b=My/EcJ1HMCPSVb9UUIKiNzCsvO2LZrkwCnbtFv/XUvTWvL7eaNhAX8CRaU897vyNci
 9dQ6K4or37PWdKCCAvijhQf5BbMWdnBe1am8BNcSSXTvW444WM0m4+3uRn07n6vjvWso
 m2b8igMSP8yt4gdTtsRJ+b1I/dKvx/r8R1xRb3ZwvVbx3zQtLjPekcWgHDpvYQbjMLjW
 0N0QacLLfgaNniv/yVAdwBx9RGTICif+1MFVh1SPsPGbvcmGKMb/UAvDY93hNlJ0ZM9A
 dDL9ZZ5NS4PykFWsQjbgDI9uT966YddvbcxLLXsSp0YPfJXbkpSbg9Ycy3UB24eAOBPn
 l0YA==
X-Gm-Message-State: AOAM532+3p5rg3Lk3jF62sw8lx/YNlVrssz9lgwxW33HJ5RhgKlGsWOh
 l6KZDNwM1FLUN66DC/3O8wBwGKWXHsx15+KgJRk=
X-Google-Smtp-Source: ABdhPJxfoToNQn9KjFoAoIswp6JDKfrDsiDmOq8xF+ftCzE4gS3Y6LqYjfczLpMx6OLdPlNQg2TvTn0PMs3miaLmM2E=
X-Received: by 2002:a17:906:4eda:: with SMTP id
 i26mr9192529ejv.301.1618589999264; 
 Fri, 16 Apr 2021 09:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
 <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
 <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
 <CAHXb3bcpUBH9F=K9npwK-xO5sX+H11EV0_Nc7Otw7o93M=DKYQ@mail.gmail.com>
 <CAEsQvcs8HasvcJm0oEr87gNPxB6o2Km_NtAojTq+VkEX9EZd0g@mail.gmail.com>
 <CAHXb3bcMRrtMtfoHOCikNAkXxemnScfTPvJ702N_z6o5xj-G5g@mail.gmail.com>
 <CAEsQvcuo0g9STXn1d-Wux0TOH32mc88=Lw44r0ng+QocztcG3Q@mail.gmail.com>
 <CAOsVg8qWkYnW4sYP5S5A=BWvQWeBY08DrC7JZ9nNF8_nrsNArg@mail.gmail.com>
 <CAEsQvcs7y5Gr9X2vNkMHZU9akJAuBw7hE-XKcYKj9CJdO=GM8w@mail.gmail.com>
 <CAOsVg8rrJMdzADsRpjTOmi7Dk23bfej+KRFQWD77s9pmNW=g5w@mail.gmail.com>
 <CAEsQvcvUJ0p4bPLJhzppJR-uFjoyOiu2_=QtAvMvNwPh9AfAFA@mail.gmail.com>
 <CAOsVg8q_5yWBOR6DROJT7=Xv=R2yVNWSEjt4MUAx0QpQ6Af14g@mail.gmail.com>
 <CAHXb3beJxepHYraSXGCB4n9RBbBnLo05dcG=7nED1b_ZGRrMaw@mail.gmail.com>
 <CAOsVg8r85TsJypOSm5ZRv49uv+v=MZyNONe32AgGZL0fbYNayw@mail.gmail.com>
 <CAOsVg8rD==rjuVU0MR8rkp4VQi_6=UfO16huhsZx4-hM-su1xA@mail.gmail.com>
 <CAEsQvcuJF9D8nxbBXWbYKer5oTr7RbMQw9YiXzqb+Hof=gehCg@mail.gmail.com>
 <CAOsVg8oEqEsDVA67s2OoHbvLgTy5wYjwBOTOJeX+uS29nPf+kw@mail.gmail.com>
 <CAEsQvcsUTchyaDqp+1VOnJuREP9L27JkG90pY9aD3TBLWaAdSg@mail.gmail.com>
 <CAOsVg8qptM0bYLczunL-8fF+CiXHYJxSgJWObvXQXsL5Mux=rw@mail.gmail.com>
 <CAOsVg8pEjJvm7cHeOivQursVUiOs+oCz6oWTt+8R6Sx+2TiHJw@mail.gmail.com>
 <s5hczuusma1.wl-tiwai@suse.de>
In-Reply-To: <s5hczuusma1.wl-tiwai@suse.de>
From: Lucas <jaffa225man@gmail.com>
Date: Fri, 16 Apr 2021 11:19:44 -0500
Message-ID: <CAOsVg8rmVjjsU8yMdqCPV3wp5VHos94PH=CA4XdeCj6wdae+TA@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mike Oliphant <oliphant@nostatic.org>,
 Geraldo Nascimento <geraldogabriel@gmail.com>
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

Sure I will!  Thanks for the tips!
