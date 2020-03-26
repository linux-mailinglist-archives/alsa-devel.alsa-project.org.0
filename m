Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DCA194670
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 19:24:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EAFD166F;
	Thu, 26 Mar 2020 19:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EAFD166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585247075;
	bh=DxL0ioGFfMwjynlJlfLLWjyZe5fDeVy9kFRmHMW+Zn4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gvGyRXhOoufinqAqSfW728Iic2YuaP8bIFuSBnVMPi7LGdnLxIrEM5/FbXfed/dZ2
	 MvI7KZeuZP3Z4N9sa3AjsNo4u4j8J+yjC7W+0OZ5w3jy1m7j6+N74wrKpBULalCE8F
	 rpHc1BM5SGCMJ4aym4iengtBbGzetJztyVVMiyaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 132C3F80095;
	Thu, 26 Mar 2020 19:22:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83B6EF80227; Thu, 26 Mar 2020 19:22:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01F44F80095
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 19:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01F44F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HUtCop/N"
Received: by mail-ot1-x344.google.com with SMTP id a49so6895152otc.11
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 11:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DxL0ioGFfMwjynlJlfLLWjyZe5fDeVy9kFRmHMW+Zn4=;
 b=HUtCop/N6lNjtvAtGQl3Qm5p2bBQhIlBLItjnkXj5ZKpT5PppcECix1JfOr48DRO4N
 iavXL5M/GEeqb3r7Rq1msl0BQpyCkLqK3Ve3pqzIdC6/icFLJOyCL9QRML8kWvfUN11K
 Vkiskx8LkX2OP9kr+Cz/F9EvejTbX1PmtkMqV46iwKlukQuniFRu6D4dWMNtzALmN4UO
 J1LRjHyLjfvSqMiX3w0CJ1TIfV6fo6HEMGexJE7SVUYm2AJB+o+ujQdi1DIL73voh0rn
 xuEeof8e+1XOjoagT1sxjmbw2ll+A+tolU0hhsZx2FK5/sjirw0gamQH41k21r31Ku5p
 uXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DxL0ioGFfMwjynlJlfLLWjyZe5fDeVy9kFRmHMW+Zn4=;
 b=ZjmYEJwaX9IEC925edQlsRSQvbd+2MVRKIDanhso6cvRR4hq4KOchLa7Qg1TT4gzkY
 C+AQLxaGkji1+CsbXs5wB5caDj4OQwbIPsUDTX3TKsGZakAyutzB2Ck5Wd4jKUVEQ8BL
 RLWu7CZDRbsI/HjQuJbR3DCuFZxbJKWiAZZPWzr5WFFJctnUX5RJW3fsPhENmTy6qO/0
 M6VnTBYg0g/VvXlYYx1PGmukVwrv43bQlKUh5+uq9WIoqReG5nzAVuTxcE2lv0QHw1Xf
 GvPiiqBOEIsMzsNRKMAWLfXAm5tfeLAWCx7+aGFvJu85j3GQ9ndW0f/nyzE2+fBgijpd
 uOFA==
X-Gm-Message-State: ANhLgQ10rX/k4kSz5I6df72KTr7Vfkp6E8LNMABkd0WPbB3v4WQsonSt
 ayyQ6YGhuOMoSD9CtciFXSEwN70NLQgtwLw/h2sBgg==
X-Google-Smtp-Source: ADFU+vtksZIIqekjFEA7AN+kJkboACCxTSymovsuMEtWozINteGk0Gs4LbaZXL36DLqPAcNR1Tpr+XMZlCKK2XGsTF0=
X-Received: by 2002:a4a:b507:: with SMTP id r7mr6304216ooo.70.1585246964628;
 Thu, 26 Mar 2020 11:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200326172457.205493-1-saravanak@google.com>
In-Reply-To: <20200326172457.205493-1-saravanak@google.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 26 Mar 2020 11:22:32 -0700
Message-ID: <CALAqxLV6CQkJXdtBD5vUOvLYCe10sEUPa4RS9PuGB2=e4-80rQ@mail.gmail.com>
Subject: Re: [PATCH v2] slimbus: core: Set fwnode for a device when setting
 of_node
To: Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Android Kernel Team <kernel-team@android.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>
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

On Thu, Mar 26, 2020 at 10:25 AM Saravana Kannan <saravanak@google.com> wrote:
>
> When setting the of_node for a newly created device, also set the
> fwnode. This allows fw_devlink feature to work for slimbus devices.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>

Tested-by: John Stultz <john.stultz@linaro.org>

thanks!
-john
