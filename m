Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE7336C5A9
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 13:58:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6726C16E5;
	Tue, 27 Apr 2021 13:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6726C16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619524680;
	bh=/rCi+qrzlY6Vvi+UEC7TPZLhIUKd/bm7Ab7I6i9ZUC8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=hcuWlpRjNhjroUpYCqAMyPvrHWm3jyapM4EGA16vrVhHdOQIshv+sWjbjVt4kZshW
	 42tBnvl3aIH9iXPgYOFg7MYO5r/o/at7a1eubuSbelALLPo4MY9ZX3YyRUl9A3HGu/
	 TC695LKToIQXr+6kx+loPDNxm9YQRtU0iffxxqUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9DBCF801ED;
	Tue, 27 Apr 2021 13:56:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46231F80117; Tue, 27 Apr 2021 13:56:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sonic313-20.consmr.mail.ir2.yahoo.com
 (sonic313-20.consmr.mail.ir2.yahoo.com [77.238.179.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD7D2F80117
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 13:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD7D2F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="fUwm4tJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619524579; bh=J34GWdVmuCttjqR/EheZciCTy2fMGlRD8lEkwRwfaWg=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=fUwm4tJ9XrFGzTtZC20geeBcPhGM4QPnYhOBV5mgPiNMWNgvO6EFBuGIShpaF2G8bwD51XyuLaxQTs5EJ4Ahde3Zj95L9tkS5r4iYJIgU6wK7gIycfOlVHpntxc9PwmVXUeuNiJlnmT8K+OZQeak3GXn0OMBX3MRU5hK6bYFxbJ7khVRhri3u3YCL7CpJs88TjeupBsjPW+ypraoexkjC92EqyjlsAySL4F3uPVoHF4ZBA0+i/pE4BUT5HMMAfqiGmVuJVbzUZS18iCyZCNjTdXz7tx6D4Emb20Nb/IE52mLBVPFiepM0KzNcOK4FcGHoD0m2MJPusI5PElottsr2w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619524579; bh=fI6Kl5iNDuSMxnoSnn9ee9DqeWK83bowfQiwYt2z+cU=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=OQxjzrn52G5is2r3dK9AkULGeHDTiF39nUkUkN9/Ab3c9eFIqTThIu1El/u0dfw4nXJlNe/+X+7hC6JPA38Eixl6LW6Qu+718vHeTTL9gM9tBWztkOiLDlTyvSY9195MNnLR04Bw2KfjnNwoyhq+hWamwuzyzQ30+3boYF9u0cMed1/JqpwIiYmYzestMQGSgIGhJ0kU+VQ4f14/5aX0U7GoQy7fIcHdQgexVf3rSrk/OLiF/nJ3tetWBMKAp7PHmuHXMbb8MwkJbveHyJnTfr6FJLwDcfEmdK1L+uxn2m3jApaFcovXt+IPyF0p9vnBGb2/6NXh3eVm74s6JZVIeg==
X-YMail-OSG: CLJF1gUVM1n53P0pKhKyzGvddhoGeZhkPxz77VuC2IlKSOgghW81OMSwOXA74qc
 zAAZUGnkss5h4oFxoXTI7LSVdVoh4orbU_bAMY7MIxcv.Ip05ObADPAyz7Fv5TV9Y64ZdqIjOTCt
 .lGtOJZAZEiMbyDBqiyhxOpPekWX_3H0DXwXMS72q9SMVTo8EXWwi5TTOrCu9zgEiTdXVLlVGHVK
 cgmPs15fJGFs_O2QfkvqXShD4dwRf.ZtFqbtCx6Gu482j5cqhUGfJtHrDpKKiqcBNHjn7XgBcqQQ
 BhVoEPZLHRMKrMkNoEYNmi.KLMH.nlamw0iMziKJsETtxI3o3bn3wVNXH9yBKcDWMK0lpx1yA.gO
 foo9ADy3FVC38Gx7pQOr_CFE3zkSNCBGZRntm8IHCv9LzGmriRypw9OVKAzk47gRDH9JLQQYU6e0
 yJDYs9wq9Qi3lZd_cqyPS5rbQmkCn76q5DjTD_Gj6lVUJlx7v3cZH4dLRYIMU0nRdjjhEOKfIU9z
 3uT1KkGJiTTWvxWzEy1YCataB1d_LjtDwGDIjsrKUECgqeMDo5XQXIqjCIcG3n7wnomcTnNlXhUF
 TLHBvJB8LRo9j4cPRxJXEABrOAoX_vsrWMc7ArO67iXXf3AZHC43BvWitdDflmo7iAMviwp4Gc9P
 j35k0eI0XG5p7AK7FHMspArLoKQBX0BHsbB5qpC6wyRJRkLcXo.C7raFdz.gCAtZEwDc.8ag9vE1
 6GogYedq0FFDuX3xz0iuX5oG44LWiXnE7560enCRitbW219mFYKbF.UIGaR4cxDZVJWkMlk.gWLj
 l4Tv4.cS5RcFKCylhP7tcqhE98E1490cvuyvUo5Qf.Cx8qvMn8uzxvshkLxa0_0XK8bUPBLjphtm
 .IKmYQKae.ir4Yz.lvKdhjP1dUECnjsvCJ1HjQNmpPOVPuH1ZQ2RYQ.ktUIUFkOi9TgZsO_zjANV
 5XJrcI6lza0NZA7yrtA8QrofBMGUXNEBEhjdsvAITKr42G2YcBCncmduXm4OzF7jEojMotGDLcsO
 aE8NtRZ8yBt4A5c2pYGNFeVPaRFiSWAvJdCTLOW_ox87pcLtPetANf_.i96YYtPUS79.vv654Tit
 bxKx4NnsXOi3cpvnOZytslqsIPNLbq_N9SIaV.mSMKtbc2upSjZYeEmx.2QLTRI_eIVBTRaiNRXG
 9PtIQMBgv.78qTXqE0I8sC8G8lwHDZ4HtqG07ekUAPfKrAboTc3KTvb0zYdVjdH_Uw_41V6NGYLd
 XfwboQzcLmXL6TixnNJxLsU3q6QmVVIowQU1cbFwwcR5Q9swdpnZs.rgxyM6vSCOsNb6D1TfNYOe
 oMac7xTR_JwPtdyiuLQMwM3BjRpdgJgoHStLTiPuhzFNmN0F2hzQgrEbQ453heGm27lsZGGk3Olt
 YmvYEFQ3vzJTLr_GLVnU7QLAY8EF8YJaqJnzCzvHBPsZiIgy_KFHTt7IF0yBou56C8OIL8baX9g.
 eoAk6e5.I29LBgENurlvPF4AWfJfy6cV6KmAMDXU228hgRXFuT5qPscMplAZrOi49.X7zkqlfijP
 DU_jNsrMP9AEx3m.u9wy__QvqGyjTwqgxbTE60uFaDf_YPIfcsK5P3O.6jvBdquGxb1mDPKTul2i
 WLoKQdQ7Db0GDbtBlDk3GxSb.pCvI3xmFQGy8tJaZ9fh_r2ackaoBtWZdwJWwu9YYuM_qOtvIFep
 Gu6dkVy3beb7Ziq4RkJ5DnP7jveBLUYl8sueG69fxOoi0YOnHhsM_Ux.u44GQGjVeyL9sw44XtTB
 RIzyKt4KAxtWEau_ZtcuEtLYpZpmhD3i2iMR5CojaYUze1FkAM_xRdFWbYXwYLl6jK4Rk.CqD9Pf
 RouU04UVZNGU_kASQC1TpWVY_mfVOhlKQfaQW0P5kyAqtAtrcvCjZ2OfXMJ9e9Yyo6MdZEeoZGmq
 ksGwZeUkFUdojfcXxj8S8X_tss9cpnzw1mIagacR.5uHAGazZYvK655t7JIaIHPHOS9SdU8GHuOH
 3MKIxRcHltWvdFXqXopskDhCiR0Kk40vYvnADHJiXXQaZ9.ran2UMLGRMHdXl71mQcbKOnZahInY
 mF0iO1PmiRIVDcl21xK_VJ_qM0MNH26.KuI4XHiemzkIQMKL5NtL6poMa1h9xMGztkf8tIpdJQ1N
 UngOzhQOFUaDJ6WEpAXNPZyufXEvDcYNUyvvlUULyfG9_jAhURgIKzXz5yvfg1efQ9EOecAhdQVy
 4D7v5hqwIDQ3YRF707a6yxPFfdWS67y4ptTsbGx.RS_txtQuxywFpp1fplAYFZZYfEJB.JWbNQvC
 hugIC54quDZD1MdDMVKoI0WkyY2Rnm4q6kAkOkSHxSgR5qHIsnw7yWAVu93ssR6J8U4nQuIeA1Pu
 WQzcsPiMLuM8bSAiv16mtFeg4WlEoB.L2oOBtrmylX8WJMBhwIo5N5jPNnRKTNJXrDR4_oGm3Ci9
 XE2LgqonoImfUsF5cm89WqMo06i1qK5jT_vJzEEkylDcrn4WiZUh_NAUTaccIkzuNehizHsQmKfb
 uHFQ9Giw00O7t_lHmk_eG0Ii58n0u5KHKuxLvlNZT1MvRfm5oDAzwGR2Kv146Vm4iuZD0cdJukZT
 WqkM6VOERoAPbkeIZn75IpQ0DZnqn1esj10VJMQBZk5CP7ySgzr4C_lQGXn37520Bed0fhwMU6a6
 E2rI7fCs1wEdyf_cs.e2ZdcD_P3v6cCIHSo1RNOJGTZ.KlNBYlvG.z2p.JPKav2_vf.SNUTxjFjV
 TQ3Tty2phg7KoaUno.AWGle8_DeAnlQhG3HFkX_5czhCzER2hCPQrg_74aEpiJyIu39pg4xdiEpP
 UdiaeRSOcjyFZsadm7lnMTw--
X-Sonic-MF: <htl10@users.sourceforge.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 27 Apr 2021 11:56:19 +0000
Date: Tue, 27 Apr 2021 11:56:16 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <1518656399.1723591.1619524576046@mail.yahoo.com>
In-Reply-To: <2120463681.1712899.1619524438345@mail.yahoo.com>
References: <148484793.4894421.1618654607945.ref@mail.yahoo.com>
 <148484793.4894421.1618654607945@mail.yahoo.com>
 <877dkz5hz1.wl-kuninori.morimoto.gx@renesas.com>
 <1772063602.5910217.1618841824599@mail.yahoo.com>
 <87h7k152du.wl-kuninori.morimoto.gx@renesas.com>
 <212419469.6653726.1618928398310@mail.yahoo.com>
 <425493399.6730534.1618934642983@mail.yahoo.com>
 <ec99afd0-fa6b-71a5-653d-f1ef9687d5ed@gmail.com>
 <1556414365.8666901.1619176930979@mail.yahoo.com>
 <989629357.29063.1619217027895@mail.yahoo.com>
 <2120463681.1712899.1619524438345@mail.yahoo.com>
Subject: Re: ASoc / PCM recording-related regression between v5.4 and v5.5
MIME-Version: 1.0
X-Mailer: WebService/1.1.18138 YMailNodin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/14.0 Safari/605.1.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

 Hi all,

I have come up with a second way of fixing the regression (the first one was a few commits before that):

https://github.com/HinTak/seeed-voicecard/commit/19067f3333d7759bdf626e62bc09a7deae4627a1

As far as I understand it, the breakage came from the somewhat unsual design of the SoC device: it has both recording / ADC and a playback / DAC codecs. (a pair of ADC ones, actually) to do real-time echo cancellation / noise filtering applications. The recording codecs use the playback codec's clock; and the playback codec's trigger needs to be called, before the clock can start.

I am not entirely happy with the rest of the vendor's code in terms of what code is where of event sequences, but I'll leave that for now. 

Would appreciate comments, etc.  
