Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948C3B3AC0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 04:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC618165D;
	Fri, 25 Jun 2021 04:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC618165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624587074;
	bh=u6ZIVXhz/UNCimjfOeJcqT4zqBu91KJnpeh6lNaxauw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=n/YmVU4eEnbfBpDcFlSa/+s2ujdwPPo5+SNr5Y0GLs3jmSE0Y2HH00nxA6QyUyaFc
	 XSmmWPLM3n7M2wkC0KdrYYuPgUdDmFHG5tI+1ht3zh6d52r5ILzpjriJhtD2wDMSsK
	 KvTphO+p21YDt2X5d38bfwDSOAT+huIC9pZRESKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E1A9F80137;
	Fri, 25 Jun 2021 04:09:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 555C6F801D5; Fri, 25 Jun 2021 04:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic307-7.consmr.mail.ir2.yahoo.com
 (sonic307-7.consmr.mail.ir2.yahoo.com [87.248.110.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36E6EF80137
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 04:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36E6EF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="aOfbQzaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1624586976; bh=w2wi49DS7x1ecBDM58RFKrfOQn0qXQl0PJ+pDhqmHkc=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=aOfbQzaVFQnzhE1KmCAkyXQJ7WvWvmfArXS3i2HyjfBh2xmIux5rmpaHA9lovh9+5qJ8+AMK4CZZRAnBhEtJQWIyS75491CU5EJLmUkz+WqlHbs0OIG1IEhHIkMV6YZjqV+YP2t+dsUkuJk/bh5eAAPPCgjZx1sYBFC2mY12+mQbKd+XHGo8HZHg20+eIh/scyyOFzhfCEW66zfymlh+kk6ScKZCGdi6dZ5YeaGttb4r32CHVyFgnhqRim4RUt3XAkPB0DJySsaM+SIXb9moFwmE8cusoq4Tpcqfnk7P4iGxG7Eqwzc5D7aB4YJhVAzQdlzZCUhjl+gjNIimyricsw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1624586976; bh=sdp2F8y1C/aaI8DTFEoVVdBXB/PL5LjvMCfz530Pm2r=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=bGi2NVJIU70WAlOqF98PanPLM3TIu0QXc7twr3+fAcs5fQjEyXlCRgT0t1uQCcKeogI/tuWI8RfbXhLJSBdIhVHKcmtSp9cIQ2dquEFZK7VGuRJxNsNbti+87i41ddV4dhJjBExh1wmWxPiybjF/FswjkXO8bizn9AiMq+eParPrt9VCjVhILq/kouHvH9imcIP+j9yNTrZBpIIcwkMw05DYxiGVhI5BHA+oxnfkH0dgSQGwShmElX2F6ueQggkc0zAhpTJnDgwyaOrlBpsY8+XzlTwKa1pp9i6rzbm6uI9uhA5H7goq9NaGiWZpFsj2vhtxVv6TU07yDhuQMpa4dg==
X-YMail-OSG: ylWVqisVM1nxgVP1Y7stPHUAqiIaEtf1LlL3WP4cYcfNmnwgl2ict5CpKs3zkly
 X15c2l03zXRxtB5EVVnYEFcxI_Mg14tde806C2eOWoKTvVnNxXL0HMBBdj3fkS70jYxmHNQ9uWE5
 NN3Rn2Zlmp0qGuPwxzG4FcA86QvV2nVH1VX4LG_O9SRREpXK_JGkR2GiQ5a8Wz7QSdenGyUk5tIc
 o4IxRliV9RkAtPQtlS5frCrEs9jw6Ic4rrE8aIyd6O_RXA1V4KNsupr8CUpsl5M0mUnyF6TQfwjd
 uI.B2E.wr8Jg.8keiYM2Q_ZlZBsZHwuB.cqBwPxhBPkhW8hF5qTSLXwT0H6iAoH3OPi3xnQJBvRn
 sodk7X1KtxYS.ZZYnzfs_EZKCh18Nz3IuQoOdB6Q4DOR3cO4_bm39V94YiIcnilDbhcfR43i97Wi
 Ja4Icy7.Ld9qYz.KaqL_cGmvy557VfmoUdCTowzOUN325RjHV0fr8R0_NEGE4fIMGpvEvRCgWx1P
 RY9PZNxNXURcIR2kWjGDCaYuQIAQf0avWSovsg31J2ww6zo5r4hQjY34f7nwvIwjIpq.dQQDZXbn
 G23hruSBhFgA3O5mUP3ICOrVvoJF4jDe.kmRwO6wEI_YFgFEqxwwuqJ5Sfv_OvHnUeka2myix.xM
 Ji.cHZVAA5OPa0vkS8GUYV85C7PFCXjiNDDRM5HOrMciVfBFLNYkiw1C.v1GcxoudmO0nIBRNLC0
 4ik.0JcnUBJfT1QU3ugG5YwTOfL5J2yQg.wGfujeyhug_1xCSwTeCtUkB3Jp8H.ZBtBVs9nJkE5.
 vcgMmFCrv83ecfCkQyzQFBLcEqbVz733Jp808M3M3sqqj1fezJzgZ6TjY9ulk948WPrxqMvfYd_g
 A.VcI.Wpa5uiBLroPKb2iSDCvBr_TZeG_KxSKMrAOkW1s7dGPtndQey5qGRT6z8PvlR81lXp56wb
 D50iY1Keo2eflC9s4KUPzGANiu21vjlJh9gz3SsOWIm1IuJCMeMlHPc5waDRNDcQnU6XEWmJL1r8
 28v_7XVoAjGOKSpkAvVL7zns4deDGonWMck51w7mWAAJC53R3eYWaiOmLueyys1rELOFsbCTJ3iH
 nIsfwexTLZsQayG3KsomrwMkBFccSBFvzYalD66g3JG4bpqAgGMiSH59C6sOaZHN2PYBh1DPkaRy
 IJIyBfawMNbSrFN3xGT6rDekpvZiiIz.Sgrtq_v5joxIFChWE.CiGzAqZylKPsgNkykYaeRz6eJ2
 uC0LA7FxHdipfRzHTjj7M5Gxvk5go7hDTfYu_sBFHwReoOWuUj.oqjRE.YKvyBSuIXqGgW.yp8ld
 kz01vKH0UhAOYZ5cFgVGsZ9KjyZ5ShOq91Lqju8WtbYXCMgSjMMdryWsKp5xHEovBqAQLlFqSxyg
 .zl1.zLfWE0ltm2Kkqt3zuh1hrPAAM4ReNS5hlo3EBuouofBS4AjAynFyrfqCwTWzmx0AUS5_rg6
 C5Xg58c80JCP7tSVqSPwxKQyY2.Ry2Y4iqnvk4ceOLZY4XjSbM4BbhzKxknyLMBeoT0GxJED8QNg
 GfSkroIozcxyXEyyl45BcraoZLKgwE1HyO.6Cqixi2q3AvrzEdSEovn2cB3y8XbJ52GwuUSDeR0L
 WTtFy7CT.qmehJsP0LnQ8ugrcHazK7RfvbqlH_hdLgd3UUi1DNwQkOVKqqS.OdNNdg5uMHvcPEaf
 q6GGZRJN9_3YRkEP6qMS2G.7vG2G8n8z_Ulch.89YsNSkOLWGemBIXczrAE.AAFh.VrNpPiu4.hU
 8AGh8Alr4NYvXGFwWYvQM3BNU_p_jgyx6wpr8yK72LXtXf41fdd6jMEG.7FrKNuaSlEZEk0YCECJ
 JbnFDql3Ue1dG9eQJZhSgYivFASy4PxAkK.WxMegb4WEhRxNGcN2bXjq6vr7Eb8Y9DUTJB7mw9is
 OVyTSBjzKqP.TyUSQfM71mwYOV3zv3pV24lA1qJ.e9RB8uA2aYnPDCnXAjp_fz9WMHPpqqDeEgLg
 PdVJhCJH8t3ljIzNWpqh9k09AxLoPoGRmqhpgfWe5MtUx9ztaTKbYsVR1uCr65EErn2UG_qGlaAh
 orZvfIvk84vopQS9Msj9PboA9D5YTD4L4qsJSy7CnlMO9ihXulexuxBJb7n3PXd4wHfrN5RXw56o
 oLUSPaAx0vbIayH3T0eMUHuC5GdA4rHsk_Jh_lhc7zIkZXOw0A3GVhyDWIWKCYXD8P0Jb7CSS.fn
 oK7jRpRx9fG2S_kTHUdqlFsHoyGzolPiTBTPm1cWvtJ2gjqC.GWA3aHy7Vy6mxoKQW5HuSfv4DiF
 .wHxt24NwWf18Ok0B9VEUjHYvmZSLi8tRD3HzdxJV.LWwJowTtrCeahA6QFuu742fU8N8ZiQOj1l
 xlXXL0AYB0XTJakx90NT5JtGQef1EZIq5Y3n6syoOC1ea6OPoCZZ.ExuRVVik1_noH9nGSd8NaG.
 TPzM7tiL9PVyJxKon7pG67fClVCpIiUpI1Jw5A2ckBma2io6aTZWOYUuTDYUa0R5LImYT5RaHhLR
 ix0fevRuzJ_dNZZXNzuSn8qolPLnHcAiv..HxRH5FHWT2JICoMyEXLoq_EOTzt12usz54CCaFzSH
 eplkSGY1g1A0QeLc8gNsXITkGOv04iDT0jCLJ9fvh2leLQ.aJTTnjAg64
X-Sonic-MF: <htl10@users.sourceforge.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ir2.yahoo.com with HTTP; Fri, 25 Jun 2021 02:09:36 +0000
Date: Fri, 25 Jun 2021 02:09:33 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: "Geoffrey D. Bennett" <g@b4.vu>, Takashi Iwai <tiwai@suse.de>
Message-ID: <1760646906.5744668.1624586973083@mail.yahoo.com>
In-Reply-To: <s5ha6nhozj7.wl-tiwai@suse.de>
References: <cover.1624379707.git.g@b4.vu>
 <49721219f45b7e175e729b0d9d9c142fd8f4342a.1624379707.git.g@b4.vu>
 <s5hfsx9ptyl.wl-tiwai@suse.de> <20210623010327.GA15559@m.b4.vu>
 <s5ha6nhozj7.wl-tiwai@suse.de>
Subject: Re: [PATCH 01/17] ALSA: usb-audio: scarlett2: Fix wrong resume call
MIME-Version: 1.0
X-Mailer: WebService/1.1.18469 YMailNodin
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Vladimir Sadovnikov <sadko4u@gmail.com>
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
Reply-To: htl10@users.sourceforge.net
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 On Wednesday, 23 June 2021, 07:39:48 BST, Takashi Iwai <tiwai@suse.de> wrote:


> > Of course. You know how many times I've read
> > Documentation/process/submitting-patches.rst ? Not enough for it to
> > sink in, apparently :). Please append my SOB:
> > 
> > Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

> OK, now all patches have been merged.

To avoid this kind of problems, many years ago, I have had (see 'man git-config' for details):

 git config format.signoff true

set in my local kernel dev repo clone. This way "git format-patch ..." would automatically add my sign-off for anything I "git format-patch" of . It is easier to remove the line if not needed, or just ignore the line if irrelevant, than to add the line every time. I did that to a few repos which explicitly requires signoff's. (wine is another one).



Back to this series of patches, I think it is appropriate to add
 Acked-by: Hin-Tak <htl10@users.sourceforge.net>

or 'Cc: ' as I was involved in packaging and adapting the patch series as for dkms / out-of-tree build for testing, so that I get e-mails, etc if it gets moved about / back-ported, though I was not involved in actually testing /using the patch series.

Regards,
Hin-Tak  
