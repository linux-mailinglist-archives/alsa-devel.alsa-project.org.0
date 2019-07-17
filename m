Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA5D6BFE8
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E1A91695;
	Wed, 17 Jul 2019 18:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E1A91695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563382319;
	bh=Lh8yu8au9TWhNLqFdfrD8eKM9lzTw3na/0qc7kMKJxw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mal16CRKnlEuKNtY44ObyDlQXAWtGHN0g2cQmJs3nljhlhcW1lE5JnnOV/OsiketQ
	 29Q6HTtWaDdtj19ZO5NKjgl1JETjtE4dBI7NtjSpbUC3m0jTNO+3+BPaQ/4xq5q8fC
	 ESvWJuC9jrFhfAY4xRUTpQR5cGWV6gZoYkjXPyOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B7FF803D7;
	Wed, 17 Jul 2019 18:49:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32A8FF803D7; Wed, 17 Jul 2019 18:49:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9A2FF80368
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9A2FF80368
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FZ2RaTg9"
Received: by mail-lf1-x142.google.com with SMTP id c9so17002104lfh.4
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 09:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m6oZLtgSIS9rgNH1VmPitrjtzKoJqON6sdHU4IUhX60=;
 b=FZ2RaTg9GPLEkxN7+amRYx7I4vc95+CxEEqZB1xzW84uUWox7iWgJFlyhkC3Pd4B4G
 7LmgGsdr6Brgy3TzlD7Ixz5NKHUWu1YxpZfVqUCSYYU1dH7EqJNqEj5XtVqiQbpRoXpC
 JL7S+QIQ10aDPe+c7AZIJLTskPuTR/Th0MNNr3vld7oqZqPZ+8e9ugHBIE9lOZx/Mofg
 6hqKPir+0Y5BGWo8pEwc2rUDc7nJUkyN0Lct8A1FW8Ry5axwIA1htIc66TmHZlNXYP5s
 yYgUyD6u37rO3QQF3AFXizoy07YoS/KjHpDA3nMsgv9/gYOodQ+LNjSi/LlHJfygnYvk
 fieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6oZLtgSIS9rgNH1VmPitrjtzKoJqON6sdHU4IUhX60=;
 b=Y6t+z38z1eNljIdEMsbwrz11Ey1Y7hQVUc+pTy5GgrELw7LC/DTVCxLm5VMx7RkvGx
 /+ioOV0yb/lV89+bIguPRNaQ2OYJRcf9meYI/dmxPRjyhdcar48TkvYe0x4feBsiRvMV
 fEr1QIkLZhSv2Ty5CG44mvlHzB4Wm/faEgct5LhYbpNUu20Wo6jn3FJENslH6ZY5B3St
 IXZ14gQay8cT147BA0WUW1xhrOMQ/lrMxxkWy9S7m9Vy+qL05HO0PYk2TmW/7H/TAwJ4
 NakeyxHB5faCgJN49jnmBT2wumRZmOMS9n2L/ue2ATCj7WXYTtgyqTbA9jp9mvhwgJDd
 q1zA==
X-Gm-Message-State: APjAAAXnu7IeFxrRayM1RdlJDWrIlbi0Iab0y92RjBhkdT8jcQb0uX6A
 Q2iDutS4Gi74fJZ6Qx+vnoUPt5o0+MQLUUXO+IY=
X-Google-Smtp-Source: APXvYqxJ4yTmF/pEXAKsdPEHMzOv76SGz9LRObCgiAXOj7ccVoWP20M9veb+o2mFCiCES+7mGZeyM7yluyfy94mq1f8=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr7978304lfk.20.1563382187939;
 Wed, 17 Jul 2019 09:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
 <20190717163014.429-6-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-6-oleksandr.suvorov@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jul 2019 13:49:37 -0300
Message-ID: <CAOMZO5B6M-YKB7gn0Gn7CJG+8YyvC_Xqu99wtHac_bQktm3T+g@mail.gmail.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 5/6] ASoC: sgtl5000: Fix of unmute
	outputs on probe
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

On Wed, Jul 17, 2019 at 1:30 PM Oleksandr Suvorov
<oleksandr.suvorov@toradex.com> wrote:
>
> To enable "zero cross detect" for ADC/HP, change
> HP_ZCD_EN/ADC_ZCD_EN bits only instead of writing the whole
> CHIP_ANA_CTRL register.
>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
