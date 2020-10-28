Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB5929CFE0
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 13:17:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 579B41662;
	Wed, 28 Oct 2020 13:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 579B41662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603887430;
	bh=UNxPlF5gcJ36uDtKjuQ2oj02B2FYaEFxrw6PTylVIj4=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HseTiLx1lT+NbsvvnQ6SNZHxqSNDP+jmMxVTBn4PeiIK54+NZ3Wg1ja76aDr9bQIF
	 X2BR7+V3s3J4vx+3VS3lHuyU2dynjfVJMeKdU3+oz+vcX8+V5tIUo0i//C2rzafYaq
	 qIBNXrcnES7BOdXt8eLZsnrCkrBKmRHwd+BoHoCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1697F80249;
	Wed, 28 Oct 2020 13:15:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C92FF80212; Wed, 28 Oct 2020 13:15:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 211B8F800FF
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 13:15:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 211B8F800FF
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kXkMS-0005Pl-G9; Wed, 28 Oct 2020 12:15:28 +0000
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
From: Colin Ian King <colin.king@canonical.com>
Subject: re: ASoC: qcom: sm8250: add sound card qrb5165-rb5 support
Message-ID: <f441bb6c-12eb-a565-c34d-950da2b045d7@canonical.com>
Date: Wed, 28 Oct 2020 12:15:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

Hi,

Static analysis on linux-next with Coverity had detected a potential
array out-of-bounds write issue in the following commit:

commit aa2e2785545aab21b6cb2e23f111ae0751cbcca7
Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date:   Mon Oct 26 17:09:47 2020 +0000

    ASoC: qcom: sm8250: add sound card qrb5165-rb5 support

The analysis is as follows:

139 static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
140 {
141        struct snd_soc_pcm_runtime *rtd = substream->private_data;
142        struct sm8250_snd_data *data =
snd_soc_card_get_drvdata(rtd->card);
143        struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
144        struct sdw_stream_runtime *sruntime =
data->sruntime[cpu_dai->id];
145

   1. Switch case value 105.

146        switch (cpu_dai->id) {

   2. equality_cond: Jumping to case 105.

147        case WSA_CODEC_DMA_RX_0:
148        case WSA_CODEC_DMA_RX_1:

   Out-of-bounds write (OVERRUN)
   3. Condition sruntime, taking true branch.
   4. Condition data->stream_prepared[cpu_dai->id], taking true branch.

149                if (sruntime && data->stream_prepared[cpu_dai->id]) {
150                        sdw_disable_stream(sruntime);
151                        sdw_deprepare_stream(sruntime);

   Out-of-bounds write (OVERRUN)
   5. overrun-local: Overrunning array data->stream_prepared of 16 bytes
at byte offset 105 using index cpu_dai->id (which evaluates to 105).

152                        data->stream_prepared[cpu_dai->id] = false;
153                }
154                break;
155        default:
156                break;
157        }
158
159        return 0;
160 }

So cpu_dia->id is 105 in this case statement, and yet
data->steam_prepared is an array of 16 elements, so this looks suspect.

Colin
