Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5871B04D3
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 22:24:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A03D16E9;
	Wed, 11 Sep 2019 22:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A03D16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568233464;
	bh=X7ghYNPzYuvpXmSAadN32moSgqj2r3JhbhM3YCm4zT0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MtB2sbGCWV9Xun3xsS59hlXWADc/RRsbPEW75r2sMBez5vCUD0WIpinQ0eIzsnP8K
	 pZjfUG3gqHTYjDdXqyxRfbEyxmrKlcUfkYKbjpXtxHrHbO/muIWilNIyEqg26SgJjZ
	 rkXnw2ZPNSo4Uqkiy0JEvTCSE0kZoNOQHpQcByMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B36F4F8031A;
	Wed, 11 Sep 2019 22:22:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E607F80323; Wed, 11 Sep 2019 22:22:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C56CF800A9
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 22:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C56CF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="c273U80M"
Received: by mail-qk1-x741.google.com with SMTP id u184so19277182qkd.4
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FeE04v2CknsB98QpyC8E5IBqzwd4jkTOJTnEkBU1ha4=;
 b=c273U80MJP8/8QrKdGcVtVcnf0MoLg3DCjQUK5JAV+jFUDkbFqxWlFWcx7JHWuSCF3
 FVkJ7Yplu+nYvYmbM2/PUusLXR6T+VUBhU8eOUTWOCth1yQt+94dsMTdI9jRmwy7Aif9
 TxMGFFc+i0FtZgx7ZIfmpbcqMC5wgOtIQYBm2MYucgGYCP8YhdV4Afb2t6MNU241VNCp
 IkZWep5Q5VpR+L7kRKxBXYXyczh1V2FB7zqXebX142+U20nUFo7p0JRZ+QGmhnyKoljb
 jKWFKzb4OQNxhoe47Q/vaxQMr5qbHxytHmFxnNicOnnXEqZqxYGrWYMf0zF+SqRcfDHg
 t8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FeE04v2CknsB98QpyC8E5IBqzwd4jkTOJTnEkBU1ha4=;
 b=QNt3XdI3qg0tnMtwijfpP81A3bdZ0TJy3v2vpvYdoHqBrXUeLZB1KyuqWAmAoY7nZL
 4OBO9vqrLlxzaTtQK8t9Or0aJ6v2jlcbqSHW3mb4jQAimOhSs0NNkZqQfUELuS913cmJ
 lUevbKjcHuA1refKqnk4CTTZ57yKd5GxbPA1PIT/MpP5LXKl3UYts2sBNfC6w6+BoHL7
 V7UBgbIdCwy2SfbJ/sz98o4bBVgvqsv2mJ6WdM6cx4ptTdviKkvblQiyQCOGigexL0cA
 bXEX3k2C1ydZJ7yjB3bf6HZEbN0cpoEh1GqhSX9bw1FuVIJXF42Sjd2YsNhT6s3iGtvX
 vpyA==
X-Gm-Message-State: APjAAAXDd5+vR7SKF7/aYE3jbOh7KUbMm5/YOR+TK7sI1zsJZs5y1qhY
 YUDH43QkjOK4LvKMqi4l786UJjP7IvcTM84Bh3vUrw==
X-Google-Smtp-Source: APXvYqzW26ENV5ftd77yOjvHVCOy6IlyWrqIsGFa86rgEhHFGd4n8UPAfhBb3pCdPF1+IPsfhh7GL/AkDcOaJKVIcfo=
X-Received: by 2002:a37:a106:: with SMTP id k6mr35760899qke.158.1568233351601; 
 Wed, 11 Sep 2019 13:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <20190906194636.217881-6-cujomalainey@chromium.org>
 <20190911102503.GV2036@sirena.org.uk>
In-Reply-To: <20190911102503.GV2036@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 11 Sep 2019 13:22:20 -0700
Message-ID: <CAOReqxhjf0YeUhCF9N8YOReZC11k01R+TR7N6J51fZV6YXBc4g@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [RFC 05/15] ASoC: rt5677: Auto enable/disable DSP
	for hotwording
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

On Wed, Sep 11, 2019 at 3:25 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Sep 06, 2019 at 12:46:27PM -0700, Curtis Malainey wrote:
> > From: Ben Zhang <benzh@chromium.org>
> >
> > The kcontrol 'DSP VAD Switch' is automatically enabled/disabled
> > when the hotwording PCM stream is opened/closed.
>
> So why do we have the switch?

The source of the switch is commit af48f1d08a547 ("ASoC: rt5677:
Support DSP function for VAD application") and does not explain the
original intent of the switch. I believe the original intent of this
commit is to keep the switch in sync with the VAD state. I do not
believe we use the switch ourselves.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
