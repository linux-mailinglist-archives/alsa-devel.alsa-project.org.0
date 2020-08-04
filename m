Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CC23B3E0
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 06:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF0C166B;
	Tue,  4 Aug 2020 06:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF0C166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596515096;
	bh=QQBfsB5acnBIhwMYv+ltTxpj2djV/y+SiS/FlqPklX8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZPlHJUgVHMkocU4q5YMGyU+6D6wlngdlokQGNzRQC6VoFXf2bcfdOmjCrv7ndnojC
	 cBwJp/48rXjTzy42+liKwrkovj0INs0jbanUdTVB9bTL/CKUAwSskJC/VGZQdgUZXP
	 R0jEFlip0chDtkIOUGl4wmPCLhNvV88smNitWkxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0110F80124;
	Tue,  4 Aug 2020 06:23:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 383ABF80150; Tue,  4 Aug 2020 06:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9185FF80148
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 06:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9185FF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RIe1a+u6"
Received: by mail-qk1-x743.google.com with SMTP id b14so35601294qkn.4
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 21:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQichsvBy+MsltI6WkAz/Wx6SRnn66f1UEHlGv+xZsM=;
 b=RIe1a+u60Aa8tEz9Q8BsfD2j9Ku9gGz+zWLyvdOdi3enfec/WwvGVgTlr/btqk2aVa
 4MCbROcl0O9lS4lXsiiOZtHvlEg7gJgB3uycJAgxIUxSlSLdUqOtpb4GBDZeI5hNwXX3
 BCw5jG5y2yLgjwshwLlZ2FC4FvQ0dVoWotiEs1o9pr/o8XaRpReK0VRr6DILqIDOfBPD
 WOTysAlPbVL8WGIBiq33a+B+YI3WMHgNVvwwjzAA8gx5rLylOnoaGwHMeSnLTkUd2lcc
 xercUxUDqaHfhM2ymUq55Gi5EIkImMGWZSogRgRrSnu1nzZ7oQFVmBJyOoAZeq6FQIe6
 Hklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQichsvBy+MsltI6WkAz/Wx6SRnn66f1UEHlGv+xZsM=;
 b=rrc75VRW8QhhGDigc5ijd4YJmGs+rqQetY15SSv1iS+A+YoHXTagmyP16TiZpFwHqv
 LAl6NDOwQ+cO1D2XWK+sSNsm1hn9KgA2ah/Pm5U6bv/wsH3/sfUIkr+1yk0BJeX6njAR
 WfCtvLoCNS94YUpbfKveBnA8ZSfJNi0XnT2vnUYp+PFsABTo5GD5KXRIMhwqLI5EnKg4
 PBBa9oAzn26Wy6Ul+UFJ8b9BTSYZ6deCPHrUSLqKNeR0XkDK2bZoCGUMdwBftajqwdJj
 gWFwhvC+Yu86nyZD0k2NFkQLwqwPT4lKZ1izeBl7xZ1rFmY2v+omA2ujVQJ9lSYpNPVh
 a6bA==
X-Gm-Message-State: AOAM5331k64dpzvid53zp5y81OX/SXb8YT176kXp6xuLbpT4lg17SuGD
 DYszg8vrOI1Qby80//YbA5fZgGt7m5xL3dFnp0Q=
X-Google-Smtp-Source: ABdhPJwuZnXyfPk+0sVbOn12nxRzjLREQ1LreTAdQrhYhhkygRuHaxRvUU68poaYY+kI6IVAJLkhARLnc9K+/SpWayM=
X-Received: by 2002:a05:620a:628:: with SMTP id
 8mr20334448qkv.103.1596514984138; 
 Mon, 03 Aug 2020 21:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
 <20200804030004.GA27028@Asurada-Nvidia>
 <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
In-Reply-To: <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2020 12:22:53 +0800
Message-ID: <CAA+D8AP=27SdR68T-LiQHkJ0_dJaqtgcS-oi9d8arUzvTz5GwA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Aug 4, 2020 at 11:23 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> On Tue, Aug 4, 2020 at 11:00 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Tue, Aug 04, 2020 at 10:35:12AM +0800, Shengjiu Wang wrote:
> > > On Tue, Aug 4, 2020 at 10:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > >
> > > > On Tue, Aug 04, 2020 at 09:39:44AM +0800, Shengjiu Wang wrote:
> > > > > On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > > > >
> > > > > > On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
> > > > > >
> > > > > > > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > > > > > > is enabled.
> > > > > > > >
> > > > > > > > You are correct if there's only RX running without TX joining.
> > > > > > > > However, that's something we can't guarantee. Then we'd enable
> > > > > > > > TE after RE is enabled, which is against what RM recommends:
> > > > > > > >
> > > > > > > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > > > > > > # If the receiver bit clock and frame sync are to be used by
> > > > > > > > # both the transmitter and receiver, it is recommended that
> > > > > > > > # the receiver is the last enabled and the first disabled.
> > > > > > > >
> > > > > > > > I remember I did this "ugly" design by strictly following what
> > > > > > > > RM says. If hardware team has updated the RM or removed this
> > > > > > > > limitation, please quote in the commit logs.
> > > > > > >
> > > > > > > There is no change in RM and same recommandation.
> > > > > > >
> > > > > > > My change does not violate the RM. The direction which generates
> > > > > > > the clock is still last enabled.
> > > > > >
> > > > > > Using Tx syncing with Rx clock for example,
> > > > > > T1: arecord (non-stop) => set RE
> > > > > > T2: aplay => set TE then RE (but RE is already set at T1)
> > > > > >
> > > > > > Anything that I am missing?
> > > > >
> > > > > This is a good example.
> > > > > We have used this change locally for a long time, so I think it is
> > > > > safe to do this change, a little different with the recommandation.
> > > >
> > > > Any reason for we have to go against the recommendation?
> > >
> > > Previous code will enable TE and RE  together even for asynchronous
> > > mode.
> > > And for recommendation, previous code just consider the RX sync with
> > > TX, but still violates the recommendation for TX sync with RX case.
> > > So at least this new change is some kind of improvement.
> >
> > Okay. Let's change it then. Please make sure to update/remove
> > those old comments in the trigger(). And it's probably better
> > to mention that what we do now is a bit different from RM:
> >         /*
> >          * Enable the opposite direction for synchronous mode
> >          * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
> >          * 2. Rx sync with Tx: only set TE for Tx; set RE & TE for Rx
> >          *
> >          * RM recommends to enable RE after TE for case 1 and to enable
> >          * TE after RE for case 2, but we here may not always guarantee
> >          * that happens: "arecord 1.wav; aplay 2.wav" in case 1 enables
> >          * TE after RE, which is against what RM recommends but should
> >          * be safe to do, judging by years of testing results.
> >          */
>
> Thank you for the agreement.
>
> >
> > Btw, do we need similar change for TRIGGER_STOP?
>
> This is a good question. It is better to do change for STOP,
> but I am afraid that there is no much test to guarantee the result.
>
> best regards
> wang shengjiu

Maybe we can do this change for STOP.

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 1c0e06bb3783..6e4be398eaee 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -517,6 +517,37 @@ static int fsl_sai_hw_free(struct
snd_pcm_substream *substream,
        return 0;
 }

+static void fsl_sai_config_disable(struct fsl_sai *sai, bool tx)
+{
+       unsigned int ofs = sai->soc_data->reg_offset;
+       u32 xcsr, count = 100;
+
+       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+                          FSL_SAI_CSR_TERE, 0);
+
+       /* TERE will remain set till the end of current frame */
+       do {
+               udelay(10);
+               regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
+       } while (--count && xcsr & FSL_SAI_CSR_TERE);
+
+       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+                          FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
+
+       /*
+        * For sai master mode, after several open/close sai,
+        * there will be no frame clock, and can't recover
+        * anymore. Add software reset to fix this issue.
+        * This is a hardware bug, and will be fix in the
+        * next sai version.
+        */
+       if (!sai->is_slave_mode) {
+               /* Software Reset for both Tx and Rx */
+               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs),
FSL_SAI_CSR_SR);
+               /* Clear SR bit to finish the reset */
+               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
+       }
+}
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
                struct snd_soc_dai *cpu_dai)
@@ -525,7 +556,7 @@ static int fsl_sai_trigger(struct
snd_pcm_substream *substream, int cmd,
        unsigned int ofs = sai->soc_data->reg_offset;

        bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-       u32 xcsr, count = 100;
+       u32 xcsr;

        /*
         * Asynchronous mode: Clear SYNC for both Tx and Rx.
@@ -579,43 +610,12 @@ static int fsl_sai_trigger(struct
snd_pcm_substream *substream, int cmd,

                /* Check if the opposite FRDE is also disabled */
                regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
-               if (!(xcsr & FSL_SAI_CSR_FRDE)) {
-                       /* Disable both directions and reset their FIFOs */
-                       regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
-                                          FSL_SAI_CSR_TERE, 0);
-                       regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-                                          FSL_SAI_CSR_TERE, 0);
-
-                       /* TERE will remain set till the end of current frame */
-                       do {
-                               udelay(10);
-                               regmap_read(sai->regmap,
-                                           FSL_SAI_xCSR(tx, ofs), &xcsr);
-                       } while (--count && xcsr & FSL_SAI_CSR_TERE);
-
-                       regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
-                                          FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-                       regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-                                          FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-
-                       /*
-                        * For sai master mode, after several open/close sai,
-                        * there will be no frame clock, and can't recover
-                        * anymore. Add software reset to fix this issue.
-                        * This is a hardware bug, and will be fix in the
-                        * next sai version.
-                        */
-                       if (!sai->is_slave_mode) {
-                               /* Software Reset for both Tx and Rx */
-                               regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
-                                            FSL_SAI_CSR_SR);
-                               regmap_write(sai->regmap, FSL_SAI_RCSR(ofs),
-                                            FSL_SAI_CSR_SR);
-                               /* Clear SR bit to finish the reset */
-                               regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-                               regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
-                       }
-               }
+               if (sai->synchronous[tx] && !sai->synchronous[!tx] &&
!(xcsr & FSL_SAI_CSR_FRDE))
+                       fsl_sai_config_disable(sai, !tx);
+
+               if (sai->synchronous[tx] || !sai->synchronous[!tx] ||
!(xcsr & FSL_SAI_CSR_FRDE))
+                       fsl_sai_config_disable(sai, tx);
+
