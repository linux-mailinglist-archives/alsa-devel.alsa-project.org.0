Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461B2D620D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 17:36:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0B47166D;
	Thu, 10 Dec 2020 17:35:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0B47166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607618206;
	bh=fU/OShqVJNsSLOuhnnDHGnWrSIC5gu+ywZuCCvOlhFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UeFVKhcITkzqrVEPH1z7N/KvIdBSVx4ahquK5iZXS7kb+td4iyS227wDoP6WOMDBj
	 4D8vYb6cfjuMAhNB4BN6C8zplIsTLrlvOS+yYzb/rDTOTb9OZm0RX91TbCk3+LMmp0
	 sXR9oF62c3+Ahtf2aAZ/aZV+nQOPpOvm0wiopJuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA424F8019D;
	Thu, 10 Dec 2020 17:35:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 368F8F80105; Thu, 10 Dec 2020 17:35:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F021F800EF
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 17:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F021F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="VClopADs"
Received: by mail-il1-x142.google.com with SMTP id u12so5818213ilv.3
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 08:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HZgziWGqksZdFwpQpM//etfcEVXkddI5qJWns9gejmo=;
 b=VClopADsNH8cZzeSRssv95a0CBUf1Om75Vgmv0zxizMnmLWwnxDwPQahDHXQmEQwxf
 L/8vEi7Wr2dtFpb4IpAD+CwBvBuP3yjqEUiGmcyei8PL+khuEr+AihkVru047Uz+V9mj
 hoSuvG6zqioeYbsiB4ILKf2C6DYcyv6pDoehQi9MMr8WipTAYe3mLW0WjYoVtsbsoo4r
 LeUDLhOWGOLgEQj0ZAUQDd9EzL0Uh3LBgXxsNA+G3ya+Zu49iFVkjxVodNF3lHnIT1yJ
 i+V6yFrBRniDhSav4BuAb4qMQnsY4ACEdSG/B+zGF/zVpwKrrRnhAxmvypQq6/TVxbNK
 a7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HZgziWGqksZdFwpQpM//etfcEVXkddI5qJWns9gejmo=;
 b=ar7m0o+XzuYAxLI5W9WaoihnrRsH5TOQjE4Pf9vKI1S+0lvdDJoKrfvflOZF6MhA2a
 6E7V2rBb5W/gbTp833mT84w7tV3VyUQdoRZsNp4U82bSLV3a2gGuPJTAcR+dEneMQQG5
 6rZlT+RfWI+vWXDF973xKpsbYMCLOl0rGOxk/jLvx9lrS7XSDL5jOPTmSMl9s611Nda2
 RNauMsnukl21H9r9rF68oN4FMU2N8mp7mtyDl4p+SkE8EWC/LFhVbPyHImpiYorTJj25
 YbYfRYGKA9kr9brwDRd69BFkU0AZKuwKmZj80w1sosd42wxgA+iRtyGgWWaZsLqzDsfn
 Ft9Q==
X-Gm-Message-State: AOAM531oAThJqXRhHqYrL1407QGxNXJrsDDmeIJ6J1ZC4UYoetqQ9utU
 73IdiQowYmnoR2vHdfsdB4xrJDxh15x3YmB3gVsb9Q==
X-Google-Smtp-Source: ABdhPJwkDWTP+y94AhxjrYpjdMiPMe6czjQ8uV39sbx5KD4zs/KpLEUhgaqZwERttYJgQcY9J4kkVPQjxNFsi8JdxYE=
X-Received: by 2002:a92:498b:: with SMTP id k11mr9856578ilg.218.1607618103171; 
 Thu, 10 Dec 2020 08:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20201210033617.79300-1-tzungbi@google.com>
 <20201210033617.79300-2-tzungbi@google.com>
 <20201210153955.GC4747@sirena.org.uk>
In-Reply-To: <20201210153955.GC4747@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 11 Dec 2020 00:34:52 +0800
Message-ID: <CA+Px+wV1VkTFdx4WS2Q-r-br3_0BE5pLjanggf0oey1OV8Wuig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: rt1015p: move SDB control from trigger to
 DAPM
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On Thu, Dec 10, 2020 at 11:40 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Dec 10, 2020 at 11:36:16AM +0800, Tzung-Bi Shih wrote:
>
> > +     switch (event) {
> > +     case SND_SOC_DAPM_PRE_PMU:
> > +             gpiod_set_value(rt1015p->sdb, 1);
> > +             dev_dbg(component->dev, "set sdb to 1");
>
> Now this is in DAPM it's not in atomic context so it'd be more friendly
> to use gpiod_set_value_cansleep() so that it'll work even if the GPIO
> isn't atomic safe.

Strange, I thought I should get a warning message because of the
following statement in gpiod_set_value (but it didn't):
WARN_ON(desc->gdev->chip->can_sleep);

Also I dumped the value from gpiod_cansleep(rt1015p->sdb), it returned 0.

Is it safe to call gpiod_set_value_cansleep() even if the GPIO
controller doesn't support it?  (I guess yes, _cansleep could be just
an advice)
