Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E976454DCA2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 10:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D1EE1A90;
	Thu, 16 Jun 2022 10:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D1EE1A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655367300;
	bh=dy+gdn0Xi92bMgexTrlBXZEETPRxHoxDU7522ojrfjk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a5laX84iWXCXTWkNeDwLn42Hl5efL6DtfJY6E1jnS1sz1OJ8xsHDJM/RqizbiGvAG
	 rz+xn6oedwN9k2BPhMUg+mubBjtyiJx4tr2msdiT5b/MAy2MhSK35AhHcjHKo1TtG3
	 TXSiOxcL8C08VanBjq896KdaPRCh/8UCPDEsk+sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBDC8F80310;
	Thu, 16 Jun 2022 10:14:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C30DF801D8; Thu, 16 Jun 2022 10:13:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF392F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 10:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF392F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="wqb40OpR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="C327SzpF"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C58695C082B;
 Thu, 16 Jun 2022 04:13:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Jun 2022 04:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1655367225; x=1655453625; bh=mV
 JEolc0OFYoYuhw+AP5Anf6kn9xhkygOSKD5uAd+7w=; b=wqb40OpRLyuFSVXwtu
 RLK0qLhHihhBHDRjN34U7wpfOp+tY/Dy6pD0saaXbb9SQVkockqAx+LeiPTrz2PU
 Bzoi52kG7X2gpKoRNUWJ9z1imm2jzhucw3bvccMNTocV25OMxqhWRkQUCnJ78Is7
 YrASi4g64lC588vREKYFM+u+JMHp2pXAynOf1t2OU2k6CQ3NLg40DYtvLUzE5H3W
 qJzvX+EzRG+bwdRtVm5kifk7G8bPn9PRrpYAUV+WWj1xR9KZxltH4WVTID8MMAIy
 H00kU4z5bJ8YRFmkbFjfcDXHoGN2xJybWOeG/eNxLr/xBErHyFRONnFlXpgGMi0N
 udug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655367225; x=1655453625; bh=mVJEolc0OFYoYuhw+AP5Anf6kn9x
 hkygOSKD5uAd+7w=; b=C327SzpFXzfbupJ0KH4hcOAw1N53JpZibxWQfQSAOVB4
 sgPkydFqu0qbSV1pAglQCLil+6CY7qFEwv1e0Dpj31egVO1FG8jv9MWIRglRl6BR
 qw8F4ED+PjlUcIkJOdPtUoli5qwhFRERFIPqPICFyvxeVm3bngfxVMiSYZNaI+4I
 3vJizhu/mFSlX0zv1UmixHF9YIzxQqdWt7zL19oMdxFrFthksFbuSCdClO+MDEuw
 QAI1aycbacuDhUJiwPJwsaRL/WQ3aB+LOABYm9hQM7v6eyH9QrtyhsAPpAkvr1ni
 jGryR3xD1gBAsvYorNrDa8DkMubtqRx/bxXofta8yQ==
X-ME-Sender: <xms:OOaqYpYACykB0Z0vlbLq_H_KOvEMCQkbgdsUh6qQ_ONLXoybIgzfOg>
 <xme:OOaqYgYgdELo5P6x7SgTY5fchsa18PMmrSvkGgtFv0YVKJ_Tkz5-OeKulQ4hKTEkn
 15dLhKPEfQr81BSrik>
X-ME-Received: <xmr:OOaqYr9eH1HTDr4vqg4c_Sb01-jpuStK7X4yPjSuwhYXOkFGxs3ZKp0KL5zGk-y-AQ2iU-49bo-Iuyj_0WWolghzVMBN_v3u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghk
 rghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfej
 ieeitedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:OOaqYnpdcvhZY_sgs5OFc_lb-b03Ej-XzQKehByQphF85ANc6khlBQ>
 <xmx:OOaqYkotab01xauNwNgetoH2sY_EDCXSNlS2nbGi7KD93jPNG_GfXQ>
 <xmx:OOaqYtRgl5FqxjU6C1G1TSa5F-CXv2O8MRb5t949XyFIo-a6xx7Mag>
 <xmx:OeaqYrT0y2vPtyWmbK_WC0xjSnM5Qf-omaTNwwkRu3x3g54EvNGvDQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 04:13:43 -0400 (EDT)
Date: Thu, 16 Jun 2022 17:13:41 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Re: [PATCH] aplay: Support setting timestamp
Message-ID: <YqrmNfnn2qCZV9Kf@workstation>
Mail-Followup-To: Pavel Hofman <pavel.hofman@ivitera.com>,
 alsa-devel@alsa-project.org
References: <20220616065426.27915-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616065426.27915-1-pavel.hofman@ivitera.com>
Cc: alsa-devel@alsa-project.org
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

On Thu, Jun 16, 2022 at 08:54:26AM +0200, Pavel Hofman wrote:
> To allow enabling timestamp and specify its type, a new option
> --tstamp-type=TYPE is added. Recognized values are none (default),
> gettimeofday, monotonic, monotonic-raw.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---
>  aplay/aplay.1 |  4 ++++
>  aplay/aplay.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
 
I prefer the idea to work for timestamp feature defined in ALSA PCM
interface, while I have a mixed feeling to integrate `aplay` tool, since
I have an intension to obsolete the tool with `axfer` tool with more
robust design with command argument compatibility (as much as possible).

This is not so strong request but would I ask you to work for `axfer` tool
instead of `aplay`? Then, it's preferable that the name of command
argument is decided with enough care of all of timestamp feature in ALSA
PCM interface, since we have two categories of timestamps at least; e.g.
system timestamp and audio timestamp. As long as I know, they possibly use
different clock sources, thus these two timestamps have different levels
of clock id, I think.

Of course, it's a loose accord in the community to obsolete `aplay`, and
it's easy to decide to continue aplay integration. (I'm not in leading
place of the project.) I'll be a bit happy if people take care of axfer
tool as well.


Regards

Takashi Sakamoto

> diff --git a/aplay/aplay.1 b/aplay/aplay.1
> index 3bba59d..d3b7dce 100644
> --- a/aplay/aplay.1
> +++ b/aplay/aplay.1
> @@ -207,6 +207,10 @@ sampling rates, numbers of channels, period and buffer bytes/sizes/times.
>  For raw device hw:X this option basically lists hardware capabilities of
>  the soundcard.
>  .TP
> +\fI\-\-tstamp\-type=TYPE\fP
> +Specifies timestamp type inside the software configuration container.
> +Types are: none (default), gettimeofday, monotonic, monotonic\-raw.
> +.TP
>  \fI\-\-fatal\-errors\fP
>  Disables recovery attempts when errors (e.g. xrun) are encountered; the
>  aplay process instead aborts immediately.
> diff --git a/aplay/aplay.c b/aplay/aplay.c
> index 63a4e34..5d15a32 100644
> --- a/aplay/aplay.c
> +++ b/aplay/aplay.c
> @@ -139,6 +139,8 @@ static int use_strftime = 0;
>  volatile static int recycle_capture_file = 0;
>  static long term_c_lflag = -1;
>  static int dump_hw_params = 0;
> +static int enable_tstamp = 0;
> +static snd_pcm_tstamp_type_t tstamp_type = SND_PCM_TSTAMP_TYPE_GETTIMEOFDAY;
>  
>  static int fd = -1;
>  static off64_t pbrec_count = LLONG_MAX, fdcount;
> @@ -244,6 +246,8 @@ _("Usage: %s [OPTION]... [FILE]...\n"
>  "    --process-id-file   write the process ID here\n"
>  "    --use-strftime      apply the strftime facility to the output file name\n"
>  "    --dump-hw-params    dump hw_params of the device\n"
> +"    --tstamp-type=TYPE  set timestamp (TYPE: none (default), gettimeofday,\n"
> +"                        monotonic, monotonic-raw)\n"
>  "    --fatal-errors      treat all errors as fatal\n"
>    )
>  		, command);
> @@ -430,6 +434,7 @@ enum {
>  	OPT_PROCESS_ID_FILE,
>  	OPT_USE_STRFTIME,
>  	OPT_DUMP_HWPARAMS,
> +	OPT_TSTAMP_TYPE,
>  	OPT_FATAL_ERRORS,
>  };
>  
> @@ -517,6 +522,7 @@ int main(int argc, char *argv[])
>  		{"use-strftime", 0, 0, OPT_USE_STRFTIME},
>  		{"interactive", 0, 0, 'i'},
>  		{"dump-hw-params", 0, 0, OPT_DUMP_HWPARAMS},
> +		{"tstamp-type", 1, 0, OPT_TSTAMP_TYPE},
>  		{"fatal-errors", 0, 0, OPT_FATAL_ERRORS},
>  #ifdef CONFIG_SUPPORT_CHMAP
>  		{"chmap", 1, 0, 'm'},
> @@ -799,6 +805,23 @@ int main(int argc, char *argv[])
>  		case OPT_DUMP_HWPARAMS:
>  			dump_hw_params = 1;
>  			break;
> +		case OPT_TSTAMP_TYPE:
> +			if (strcasecmp(optarg, "gettimeofday") == 0) {
> +				enable_tstamp = 1;
> +				tstamp_type = SND_PCM_TSTAMP_TYPE_GETTIMEOFDAY;
> +			} else if (strcasecmp(optarg, "monotonic") == 0) {
> +				enable_tstamp = 1;
> +				tstamp_type = SND_PCM_TSTAMP_TYPE_MONOTONIC;
> +			} else if (strcasecmp(optarg, "monotonic-raw") == 0) {
> +				enable_tstamp = 1;
> +				tstamp_type = SND_PCM_TSTAMP_TYPE_MONOTONIC_RAW;
> +			} else if (strcasecmp(optarg, "none") == 0)
> +				enable_tstamp = 0;
> +			else {
> +				error(_("unrecognized timestamp type %s"), optarg);
> +				return 1;
> +			}
> +			break;
>  		case OPT_FATAL_ERRORS:
>  			fatal_errors = 1;
>  			break;
> @@ -1453,6 +1476,15 @@ static void set_params(void)
>  		stop_threshold = (double) rate * stop_delay / 1000000;
>  	err = snd_pcm_sw_params_set_stop_threshold(handle, swparams, stop_threshold);
>  	assert(err >= 0);
> +	if (enable_tstamp) {
> +		err = snd_pcm_sw_params_set_tstamp_mode(handle, swparams, SND_PCM_TSTAMP_ENABLE);
> +		assert(err >= 0);
> +		err = snd_pcm_sw_params_set_tstamp_type(handle, swparams, tstamp_type);
> +		if (err < 0) {
> +			error(_("Unable to set the requested timestamp type."));
> +			prg_exit(EXIT_FAILURE);
> +		}
> +	}
>  
>  	if (snd_pcm_sw_params(handle, swparams) < 0) {
>  		error(_("unable to install sw params:"));
> -- 
> 2.25.1
 

Regards

Takashi Sakamoto
