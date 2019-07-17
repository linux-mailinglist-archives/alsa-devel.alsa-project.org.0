Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8294B6BFE5
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:50:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D461695;
	Wed, 17 Jul 2019 18:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D461695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563382247;
	bh=GYUtOmX9Kj74BdQTMtYMAzTVekN2+rWH236OK26TcpM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rv6SBoQnGdoRvDOf843I+2CtaHrvttc7ofRYVSLgDudJ2yKEiAkPNBA5v0as07TXj
	 Q4kC07an77L0eEGcAzn8XLjMAsfM7oxFStYKKgt5ZjtrBRXhN9IGu3QXD7b3P1Ww4B
	 6UhWeFjRcemr418U0GJBE2yL5sbRCf7TNBvP+ZoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85563F80367;
	Wed, 17 Jul 2019 18:49:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA2D0F80369; Wed, 17 Jul 2019 18:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23C67F80363
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C67F80363
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gzenRFxn"
Received: by mail-lf1-x141.google.com with SMTP id s19so17012046lfb.9
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 09:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iOMvU9L958BHBqQb0I12kZPWlzo6THyhJjrxTBppcCE=;
 b=gzenRFxnGbEsrSVDCBeofQIBjg80Z0jettMP5BgEqLf5UBKUzdp81woCAwwUgDUnZi
 zAO2Z+vbCrRfBvSApHw/qDA1drzbBkiX/CFu6klg9QYa2SY+fzgWcETJL1AZrZpikzXx
 712u+2GHTMRuACaTM6Zvjp5rnn075/9RCRPsjLeP1nsNULVFiSwHdHU0gu5UOQeacuor
 Zaizh7UuLtQO98lO5L6ITmTWlDZqm84fpmz3alJkq0l6NBzZ7lRFCqzO3imFXwYmCB+q
 ZKZ6GvzihYQVXPutCWJOYcXNnTkWJqKBvtsvEcTQig3xrcUp9nI7BKKoe2tNt97palJ1
 gsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iOMvU9L958BHBqQb0I12kZPWlzo6THyhJjrxTBppcCE=;
 b=Udvx9qDkU4XFqGJ9BCmUrVYLxXOp/kwuiMA795ckJ2AHRf2jmYTbtFYNOjhkijvI8r
 C8sUYORdbehoBMy4O899f1x4YMTRNZDB28mT0XGh2CPVpjJ5Y9Slx+FpUuEnD1gE+xYD
 aN1p/BBjsUTSeBUicxlYJuARkjoHvj46m0Rn4OaCb7BV4fSWiNKa1jiK2J7CTsP43WH+
 3K89dXvFJ55h3upB6Qj+yInlPCZMlmzTVFYqmw9Gq/MSb4VcAPYWcAF5t6gRpus7kPKB
 YgO788gDw/+W5SVNfE/hi9I9FKONHGHPlW1ugQ/9Dauu6R5ifYmbTXtoOXhGRFV+NPn6
 3k8w==
X-Gm-Message-State: APjAAAVScRkMmvN7y1B05pJq2VRP+6OuB9eGiVySdEn6C6QX6WkVVQpG
 HyDIPGziL3MSiGbo9eLON2GvCbAB2k0ebkrg3Cw=
X-Google-Smtp-Source: APXvYqzW5vqvmOthhYptcgvGOc9Ub/0ACOYeQRavNcERT5B9nkmHawHZGEhS4UN2ZVaM+SKvOR+k0UrJRGV/Dq+9gpI=
X-Received: by 2002:a19:6557:: with SMTP id c23mr4869824lfj.12.1563382151092; 
 Wed, 17 Jul 2019 09:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
 <20190717163014.429-4-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-4-oleksandr.suvorov@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jul 2019 13:49:00 -0300
Message-ID: <CAOMZO5AGL_+NOMP4JcPS_eSJSXTNSYDf4A0m=zdgjRd7vhnhGg@mail.gmail.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 3/6] ASoC: sgtl5000: Fix definition of
	VAG Ramp Control
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
> SGTL5000_SMALL_POP is a bit mask, not a value. Usage of
> correct definition makes device probing code more clear.
>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
