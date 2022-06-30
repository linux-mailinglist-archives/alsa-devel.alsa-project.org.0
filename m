Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D91E35619C5
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 14:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7292F16AD;
	Thu, 30 Jun 2022 14:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7292F16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656590565;
	bh=IvKEIjzjU4LPTr3SH+n5s231w0NrZo/WhcQOyoRJxbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z1BpH6YnBmHKndR1pc2oOZlPsfP4ydBGOTdH2Gujm/JY8itnP26BJPcm4wstHeGZB
	 ti7VArKL7qCgyw2K5DeuDVOgQoIhdZ2wmbYsru2LNbmEZIyOF02JnD172JmalLCtRs
	 BmV2a6xrdRIcPDkmw94RMKVu7WwLvqaH8Mlxe/Qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2CD9F804DA;
	Thu, 30 Jun 2022 14:01:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7061DF804D8; Thu, 30 Jun 2022 14:01:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F5DEF8014E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 14:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F5DEF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="a577l4Vw"
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3137316bb69so176310557b3.10
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 05:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IvKEIjzjU4LPTr3SH+n5s231w0NrZo/WhcQOyoRJxbo=;
 b=a577l4Vwc0EvrQPcjQ592IpDDOqs2LH+70gy+iEjdBsvx/M+bx4LDU/okbZz+EzTqi
 xSieK68x+/jTJbzDuRhio2KXcNXf0mkhWxYirTxSaHR6mIMshUGdnfcgCiZ9AwdRQSgO
 25NyP8dFEV3pN3d1oHjNF6ZqiAFATjrBn6Egx98w5UfA20iSIrbR6ezgv9/C7D7PlpcL
 30bbGK+9O72XSPAJ4koLw6SCMjBK4qMLY3vvYmD2EBRMEibfqNTR/vBb7jSifBVshGc8
 Eeex8qLNzbVVxBPymsKqZ94yfUM2QzbBq+r67bcDv/t8Ql9tJPkhkYXnrbi5mGtDoEFP
 XgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IvKEIjzjU4LPTr3SH+n5s231w0NrZo/WhcQOyoRJxbo=;
 b=HolwgMrP6aMMuD1l4hlJhVvgD4n3dIODvxmhaCfdVbEMQNRLlIknLCKrig2iTXt4aT
 S21nO9JJ2q2Lyb+khbS5mHFEoUrYWpX50EF+99EB5JT3wDBEB/vXCh4Mv9bnAshoNPu9
 XJfZgsBdhSs1kqws3/bMdKn0M8RPQrZX+rdTd2r7Jq3QeSvqmqWAexLGhgbsbW1EvYOG
 kVg8ORZC8DILsTIBokQ23xncEAqo1JLnPjl5pD6+wcRbJgQaG9xbacUrcDSlMGZpVvZh
 i45G0sYxlrFwTDpVj4ddObJQedcddUgwDw8s9DJakKInCfGkGxwgW39DAUdB0tpqQtcH
 gw0Q==
X-Gm-Message-State: AJIora+ul6fq4wtijADDYp+NZ/oIynxCXBdmhxSPF99saMik6Uo07IIP
 +yjdzEl5xwZUboYtNN5MPjPOLxFOWyZL3FXE9pz8nw==
X-Google-Smtp-Source: AGRyM1sAv3huAMlZJPo1fFK7z2myKSXoujboeKvI27J2j4nuaqNB9V7fuVMOuLmlv2hgqaEtUA8aZivsjOqi4VQlE0I=
X-Received: by 2002:a0d:e20a:0:b0:317:ce36:a3a0 with SMTP id
 l10-20020a0de20a000000b00317ce36a3a0mr10375298ywe.448.1656590494542; Thu, 30
 Jun 2022 05:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <1656489290-20881-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1656489290-20881-1-git-send-email-quic_srivasam@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Jun 2022 14:01:22 +0200
Message-ID: <CACRpkdYPQoDQ6oUBfB__pBvqMUD7yBaeuDcLfOqRKHm6sFkc7Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sc7280: Fix compile bug
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

On Wed, Jun 29, 2022 at 9:55 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

> Fix the compilation error, caused by updating constant variable.
> Hence remove redundant constant variable, which is no more useful
> as per new design.
>
> The issue is due to some unstaged changes. Fix it up.
>
> Fixes: 36fe26843d6d ("pinctrl: qcom: sc7280: Add clock optional check for ADSP bypass targets")
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Patch applied, thanks for fixing this!

Yours,
Linus Walleij
