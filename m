Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6206A15A7F5
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 12:33:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A6E167A;
	Wed, 12 Feb 2020 12:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A6E167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581507235;
	bh=ZLXSDQaweiF48Z6F/vtuD10ojqAeSVzUm8RDqnSNEnI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sFCO5ne8N9L77HEdyoA9nw+2EpTF5QSEUP0nVoH6DH7ZAXsyuS3ngCFgMzdraJV5p
	 TTxlQU1mfBYNbvC5hLQdB5uVkIQtVCy0JpFFjkcLrWuKnVAS+DXcgP9v1JccZbob7g
	 vAoK1dbuB4sROBbRtbcTwBNquvnSqf5OCtEYlVq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4674F800E7;
	Wed, 12 Feb 2020 12:32:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C76AEF80157; Wed, 12 Feb 2020 12:32:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E385AF800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 12:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E385AF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="srnvxZf3"
Received: by mail-il1-x142.google.com with SMTP id f70so1432963ill.6
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 03:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jhq+F5Vg5gXGVxGGwDzRsCFJAnXHio4Ba0xV8d1yBL0=;
 b=srnvxZf32dbXBAR2MEM61jw+61/pI7td4FK9ZdgDyMp0QtdHGlPNBy/srI2I18KHEy
 EMEQ9341OZ3cRoKeX8R32S5GkitAS+q7fMCGKLg37SuVwmaX8hHlYBR38lWBImfZjPYS
 T4SDTQY51JhRumhmP40nk7NvcMU463kJjwo57HiZp5F53TT0GxursZcOjkLsM99FxN43
 8QccU2bziUos6H+hlNHAtrPprHf98VrqOrG44HDQhpO56gokfkyKANs5YprJN64nnZ3F
 hf1b71J2CNUbl1S5SCYw1LjTU7BhjpZsfTSzuCNKu0TBvtAx4nMIQYIFYpGW/sy5Xx+Y
 J78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jhq+F5Vg5gXGVxGGwDzRsCFJAnXHio4Ba0xV8d1yBL0=;
 b=uGTLwLIvSinT44VdVi8BlYYVYrExfVBeQSD4uc3Z5fffNBOJPqA2IxWFXj49tzb/vB
 83jP1fEul/AlLteNQWDh6cir9tV3FclWeorBhu9wy05fEZgv7qIl3fIe0IzX0o0PEkf/
 ehXmyyPAYcU6dZM+dchpgGjBR7v8Qa/1Hg/+1v2eKWMraxk3Yhk6APsy5rW7gFbf3Wf0
 30KA9VDFzfqWe80V3Soo3AcghqE7AYS7LvVxPcpJs7KvpOoor4xOTERVUyNqF53HxOkV
 X4IvRsyS5Fe6/eYoFGkG6KyMuLeygtRwcOCAS1kGuA4IT6RltcarX0waEb6n1/RS2H6C
 5ypg==
X-Gm-Message-State: APjAAAVH6REdfBlH9Qk5ede0nCBwNI3fV0+X3QH/E9oU4lDzrkNJ9RxB
 PG8pTuJ33vtyNdz5K75r4N57fSeXCKmukOGuN2dbsw==
X-Google-Smtp-Source: APXvYqyCysF+Xty0Kw6QgHoXI6zCDRRSPRDXxL0EER6sqVcOTJNMCRiWOwxITCc6kPH9uv3UKjyIma87orV8iEBRlE4=
X-Received: by 2002:a92:981b:: with SMTP id l27mr10824698ili.118.1581507125520; 
 Wed, 12 Feb 2020 03:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
 <1581495554.22603.2.camel@mtksdaap41>
In-Reply-To: <1581495554.22603.2.camel@mtksdaap41>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 12 Feb 2020 19:31:54 +0800
Message-ID: <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
To: CK Hu <ck.hu@mediatek.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, p.zabel@pengutronix.de,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2 2/3] drm/mediatek: support HDMI jack
	status reporting
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

On Wed, Feb 12, 2020 at 4:19 PM CK Hu <ck.hu@mediatek.com> wrote:
> I think hdmi_conn_detect() and mtk_hdmi_audio_hook_plugged_cb() would be
> called in different thread. So it's necessary to use a mutex to protect
> this.

Thanks for the reminder.  I feel using mutex here is overkill.  Please
see https://patchwork.kernel.org/patch/11378413/ for my proposed
solution.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
