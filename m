Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02B7152906
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 11:21:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40478168D;
	Wed,  5 Feb 2020 11:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40478168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580898081;
	bh=5uHwLNjwgpdY1nXTQEUnmjCgUOQg3wYYxcOAbqxAXGU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iq7r5DGVaIieHZl8Iw3TasUGMbVPdNO1q2vw+wgbYWpwYCVHsFxXw76LYW7ZcxYNi
	 BflnYjPltKO8xn7sMA+Xsmo9HPOZLuQbRSQQrSW5mnGj7tjC/DEGqZS6AlCe2Fbqo8
	 0rHxE/g30TiJfKoAbRdTu25wBwrYzYo1BfRSLI1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4552CF8014C;
	Wed,  5 Feb 2020 11:19:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88857F80148; Wed,  5 Feb 2020 11:19:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3693F800AB
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 11:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3693F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="7OAWNR/d"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qwkNqUee"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 44E445BD;
 Wed,  5 Feb 2020 05:19:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 05 Feb 2020 05:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=iYi4VOIq59tPJk7wzbvTAPdLUiD
 WCl8nRRDq2YtnAp8=; b=7OAWNR/d4AQYpUJGzbZpAMh58hodLDem6g5cqP0cwA7
 GTbgV+5xBs3+DWQK4vvDIwR3WpAVABOyWyzMgifK8UjzrDN261qgaKcWX+CKhecf
 86AFNiWiuuUrLouxivEA3Ku63CiSPVQmqH+icETr47oHchYas54YwfNDfUfU6rdk
 cgWRbApboN2M2RBfL0wZo+gyHR3Kh7tG/0OjNF7HbMFIsvWIIXDBI03mOFKRrT2S
 0n2bYzAJx5/7SiarR8OFZohs2hkQSccWL+GNkscepXFDlCpliix+5zIA20kB5vIb
 nye1lHj0Uc90wSUtRvW8G287NygGkiBUgi7HIs49k6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iYi4VO
 Iq59tPJk7wzbvTAPdLUiDWCl8nRRDq2YtnAp8=; b=qwkNqUeeLh4hTgWjgPhmMs
 JWRbS8p4ivQZEYRgCkdrww6PaOBGkrmAFoGJ9ccWpiHlQywX859rlDt64XdhxOW4
 VFr1MFesHSBRxk58SIHeqB2ptyV9iIr9/W+2BwN/Ctjne44ABECSXpV5L1aYKJrv
 jiybzjYQxnTiUT1fXQ/+sVp4hR2bXpDkgFcec2edzEJ+5kyiCGHp3eUcfF87+rK2
 CY/3/sTLWW6tU7oeBpfJQLqOasq3RQKg/oIGJsA14hbwEFJqJgjrvX/r9A40E9pq
 y0wQbFtis49gbb4UNRtiYdmFizzf9irPnPY3rIkTnTre5NZYLetheYfN2/v20weg
 ==
X-ME-Sender: <xms:rZY6XhD_kgl6KtzfqCS-adPVroVWfMbIoY96QiIvpIGeFQd6UD4AjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrhedugddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinhepghhnuhdrohhrghdprghlshgrqdhprhhojhgvtghtrdhorhhg
 necukfhppedugedrfedrjeegrdduieeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 ph
X-ME-Proxy: <xmx:rZY6Xj4z0O8V8dY-IYiy4a-jFL9pgmUCprQ0QahcjAHtV3eBSem48w>
 <xmx:rZY6XqfChV2PTV2tv7bplLICgJw8xETIGvLUL9RweGT4JyX61qgPXg>
 <xmx:rZY6XpuBVIkcUuvLpKawxY9zS7v7QFH1EM-fkHYjMYCNaGE1-smYvw>
 <xmx:rZY6Xt0HCuGmsj0blfcFPbPxA9CdvXzanc83FN1fY6mEX2fzKTxvmg>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id AC17F3280059;
 Wed,  5 Feb 2020 05:19:24 -0500 (EST)
Date: Wed, 5 Feb 2020 19:19:22 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michael Forney <mforney@mforney.org>
Message-ID: <20200205101921.GA9810@workstation>
Mail-Followup-To: Michael Forney <mforney@mforney.org>,
 alsa-devel@alsa-project.org
References: <20200205081221.18665-1-mforney@mforney.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205081221.18665-1-mforney@mforney.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH alsa-utils 1/4] Use __func__ instead of
	__FUNCTION__
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

On Wed, Feb 05, 2020 at 12:12:18AM -0800, Michael Forney wrote:
> They are equivalent, but __func__ is in C99. __FUNCTION__ exists only
> for backwards compatibility with old gcc versions.
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>

Reviewd-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

For out information:
https://gcc.gnu.org/onlinedocs/gcc/Function-Names.html

> ---
>  alsactl/alsactl.h | 16 ++++++++--------
>  aplay/aplay.c     |  4 ++--
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/alsactl/alsactl.h b/alsactl/alsactl.h
> index 4f969ec..69b539c 100644
> --- a/alsactl/alsactl.h
> +++ b/alsactl/alsactl.h
> @@ -13,15 +13,15 @@ void cerror_(const char *fcn, long line, int cond, const char *fmt, ...);
>  void dbg_(const char *fcn, long line, const char *fmt, ...);
>  
>  #if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ >= 95)
> -#define info(...) do { info_(__FUNCTION__, __LINE__, __VA_ARGS__); } while (0)
> -#define error(...) do { error_(__FUNCTION__, __LINE__, __VA_ARGS__); } while (0)
> -#define cerror(cond, ...) do { cerror_(__FUNCTION__, __LINE__, (cond) != 0, __VA_ARGS__); } while (0)
> -#define dbg(...) do { dbg_(__FUNCTION__, __LINE__, __VA_ARGS__); } while (0)
> +#define info(...) do { info_(__func__, __LINE__, __VA_ARGS__); } while (0)
> +#define error(...) do { error_(__func__, __LINE__, __VA_ARGS__); } while (0)
> +#define cerror(cond, ...) do { cerror_(__func__, __LINE__, (cond) != 0, __VA_ARGS__); } while (0)
> +#define dbg(...) do { dbg_(__func__, __LINE__, __VA_ARGS__); } while (0)
>  #else
> -#define info(args...) do { info_(__FUNCTION__, __LINE__, ##args); }  while (0)
> -#define error(args...) do { error_(__FUNCTION__, __LINE__, ##args); }  while (0)
> -#define cerror(cond, ...) do { error_(__FUNCTION__, __LINE__, (cond) != 0, ##args); } while (0)
> -#define dbg(args...) do { dbg_(__FUNCTION__, __LINE__, ##args); }  while (0)
> +#define info(args...) do { info_(__func__, __LINE__, ##args); }  while (0)
> +#define error(args...) do { error_(__func__, __LINE__, ##args); }  while (0)
> +#define cerror(cond, ...) do { error_(__func__, __LINE__, (cond) != 0, ##args); } while (0)
> +#define dbg(args...) do { dbg_(__func__, __LINE__, ##args); }  while (0)
>  #endif	
>  
>  int init(const char *file, const char *cardname);
> diff --git a/aplay/aplay.c b/aplay/aplay.c
> index 1a887e4..908093c 100644
> --- a/aplay/aplay.c
> +++ b/aplay/aplay.c
> @@ -186,13 +186,13 @@ static const struct fmt_capture {
>  
>  #if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ >= 95)
>  #define error(...) do {\
> -	fprintf(stderr, "%s: %s:%d: ", command, __FUNCTION__, __LINE__); \
> +	fprintf(stderr, "%s: %s:%d: ", command, __func__, __LINE__); \
>  	fprintf(stderr, __VA_ARGS__); \
>  	putc('\n', stderr); \
>  } while (0)
>  #else
>  #define error(args...) do {\
> -	fprintf(stderr, "%s: %s:%d: ", command, __FUNCTION__, __LINE__); \
> +	fprintf(stderr, "%s: %s:%d: ", command, __func__, __LINE__); \
>  	fprintf(stderr, ##args); \
>  	putc('\n', stderr); \
>  } while (0)
> -- 
> 2.25.0
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
