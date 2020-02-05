Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E32241535E1
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 18:04:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CEB31685;
	Wed,  5 Feb 2020 18:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CEB31685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580922278;
	bh=mGw+NPABJhFaAenELpbozMlIE/TyiQ8pOnmNbNJAvLI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHKMI9DL7bTkd+uwZ439/oIbiYv22eHsSAPsRLPLaCZ71Hnt2a6PYHcI/RX8zf5Sn
	 KPHcfIEnXmpFUKikSgu3b4bjRoAUMJ6jH87C2VxOFzby+catep6bl+w3dJachiQZ8B
	 vsAObr6TUS3Hmqg7EUGeLm/P1f2PFYkh0Zyi97s8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE8E9F80233;
	Wed,  5 Feb 2020 18:02:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 253D8F8019B; Wed,  5 Feb 2020 18:02:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,SUBJ_OBFU_PUNCT_FEW
 autolearn=disabled version=3.4.0
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB3A2F80051
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 18:02:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB3A2F80051
Received: by mail-wm1-f66.google.com with SMTP id b17so3718888wmb.0
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 09:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bPYp7X/qdf3150Np7qyZOnDaTe5Jp/9eoEEjYwrntFI=;
 b=JrkKy2umVkShzobFs5F00CwwuV3TuIhDyYfnzq18tWEzAo9Wz70+eKxgID3Bar2Lk7
 mIOLAwZ2pibaRMkeZumfN55nyrSPKuULG1BcJxnyEt21sftFZdlo+GyO6RBvDLVKIlti
 yE8QqJ66z4GajZesmJFOOfmN5GeNIcq4pZvZjE2Xnq8s2QrwBe9TnX9nr/Mmtf5yOIxs
 9m+Cjn1hz8OmRJyoFEWI9z7x/0ZOreGDzyOTUfkSIoFr3qRLdC6ORuCOln2edxe4VJJQ
 uNaHx+cY5yvnmonrpmSKy3X4Z5zX5yO1LoSMDVx005cf/oxpsNEUzXQF70t03VmUrTU9
 8GUw==
X-Gm-Message-State: APjAAAXAhjvQyodNo3ehTUypMw6umWjyJXtDUDbrWaGEc9itUTlJec1/
 Lm4A6RsESlHXoUU5J56fRw==
X-Google-Smtp-Source: APXvYqxcBy7ooymbHh3JSNy/dTWF/afA0bOEcPUdyjmy/ucsr02aELJUYEAmKLhx5lWVAfHn/SSgYw==
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr6693030wmm.98.1580922135164; 
 Wed, 05 Feb 2020 09:02:15 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id w15sm502420wrs.80.2020.02.05.09.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 09:02:14 -0800 (PST)
Received: (nullmailer pid 15554 invoked by uid 1000);
 Wed, 05 Feb 2020 17:02:13 -0000
Date: Wed, 5 Feb 2020 17:02:13 +0000
From: Rob Herring <robh@kernel.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <20200205170213.GA15498@bogus>
References: <20200127091806.11403-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127091806.11403-1-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, dafna.hirschfeld@collabora.com,
 bleung@chromium.org, dafna3@gmail.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, enric.balletbo@collabora.com, helen.koike@collabora.com,
 robh+dt@kernel.org, broonie@kernel.org, groeck@chromium.org,
 kernel@collabora.com, ezequiel@collabora.com, cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH] dt-bindings: Convert the binding file
 google, cros-ec-codec.txt to yaml format.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 27 Jan 2020 10:18:06 +0100, Dafna Hirschfeld wrote:
> This was tested and verified with:
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../bindings/sound/google,cros-ec-codec.txt   | 44 -------------
>  .../bindings/sound/google,cros-ec-codec.yaml  | 62 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
