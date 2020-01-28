Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F2914BF02
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 18:56:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC3211670;
	Tue, 28 Jan 2020 18:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC3211670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580234204;
	bh=Qap19Z7FgSgaz9T9tthFJVE73WL85aVdraUh2LiZw84=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MI1Ty1XNFGBNKtcCiwmzZUYpuHqD0jBzH7adZhm1p1H8XEB+ni+eZgPfHuaR1hXcw
	 uQumEF46qhMyeBifp5j8OnF8nNKfchiLLgyk/k5PSly8zjShCttshRrYrQ/55aC+Tg
	 KEKxxRGDC/9GgBphR0KcWcdPQIcYWpvjama1yi6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB096F801EB;
	Tue, 28 Jan 2020 18:55:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12A14F80082; Tue, 28 Jan 2020 18:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8EF9F80082
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 18:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8EF9F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="F+P9oz+v"
Received: by mail-il1-x141.google.com with SMTP id f70so6444450ill.6
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 09:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8oZ5utNEfevDNG+rJGjb3/QAU0tfL0IZTp7vmaPCpoU=;
 b=F+P9oz+vcZA8qqlljILp7v4WjhJOWZHcsgc5OjVSQKlz9/CZcnjDVQ/uwzXXOkirx8
 +pog/ny8K0VJRYxIL8qtLOgNuUQ5/58JAx+cOWMq9rABODune2RdgSdfgioAzt8baOTe
 FqSY4DGdRWigPeU/adYjcvncwqkHnn334xsNvB0L1vo9dXcUX6aNJknqLhZHH8aC7jRG
 m/R2Smpz08MUr8CYagN/RqQS6mpk0Gz3yi8+7VZo3gs6nXh3ZStWBJlPFF9H8HZeYJ6k
 9pnla+Q4N703m6qq+eX9eeqQbz3ktNX080CXNzbxwLdrj+Zoy0ofWKxC2cfJEAN0SPAh
 AYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8oZ5utNEfevDNG+rJGjb3/QAU0tfL0IZTp7vmaPCpoU=;
 b=DQqo1Slga8UfBV7Hohkz2JMjLOltQynFdZPun28HE+xAoOA7XVQT2YEWXKN0/whkDw
 bIoVgTwkc04D1QvHPdpE2CW4DYcKFi+rcJYeEiA8z2ntZ5v7AyFqytXys2GFNRW77sJc
 f5X+vFDqcNpsQbGp0KJ6ACDbwjDKXsS5tn6l3G3wNaBs7Fhr6YrPFgXntE6RaI+hBRUW
 Vdl1haQGzGebdolDYRE7tcV0eO488hOvEyIWtmF51T2p4oEcI+POlSI8UYVdYenkxJJ1
 0rc+kSzK+RV9ItZHjBjkHIbvoaor8PzhhpAaQqPE5u0u4OKcoAk9euUYB53vj0WciI+i
 0amg==
X-Gm-Message-State: APjAAAW+Lb4DqdZnXeO2DTnHHycEeAkIIDvp+DHk26N4AMO/yeN9pxt7
 Na6Atqc6QxQR2scBxcw+boMzzW5ixm8CcnUwKov4LA==
X-Google-Smtp-Source: APXvYqxs2runCX3AHt4VKfOTPb5GVp/pTSXnVKe7gbXsQtzsvvVOc1SiEP2p7sNkTPVa6xLL4LyhEOdzJPxXxTdA6xU=
X-Received: by 2002:a92:911b:: with SMTP id t27mr20905744ild.142.1580234091903; 
 Tue, 28 Jan 2020 09:54:51 -0800 (PST)
MIME-Version: 1.0
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-11-cezary.rojewski@intel.com>
In-Reply-To: <20200128104356.16570-11-cezary.rojewski@intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 28 Jan 2020 09:54:41 -0800
Message-ID: <CAFQqKeWb4X1C0fn0HckOS-fsm6OTv2onUM0yYw4ETw0qFKsWbw@mail.gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH v3 10/11] ASoC: SOF: Provide probe debugfs
	support
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

On Tue, Jan 28, 2020 at 2:51 AM Cezary Rojewski <cezary.rojewski@intel.com>
wrote:

> Define debugfs subdirectory delegated for IPC communication with DSP.
> Input format: uint,uint,(...) which are later translated into DWORDS
> sequence and further into instances of struct of interest given the IPC
> type.
>
> For Extractor probes, following have been enabled:
> - PROBE_POINT_ADD (echo <..> probe_points)
> - PROBE_POINT_REMOVE (echo <..> probe_points_remove)
> - PROBE_POINT_INFO (cat probe_points)
>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>
> Changes in v2:
> - renamed debugfs probe functions as requested by Pierre
>
>
>  sound/soc/sof/debug.c | 208 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 208 insertions(+)
>
> diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
> index d2b3b99d3a20..d38ab59e9a98 100644
> --- a/sound/soc/sof/debug.c
> +++ b/sound/soc/sof/debug.c
> @@ -17,6 +17,203 @@
>  #include "sof-priv.h"
>  #include "ops.h"
>
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
> +#include "probe.h"
> +
> +/**
> + * strsplit_u32 - Split string into sequence of u32 tokens
> + * @buf:       String to split into tokens.
> + * @delim:     String containing delimiter characters.
> + * @tkns:      Returned u32 sequence pointer.
> + * @num_tkns:  Returned number of tokens obtained.
> + */
> +static int
> +strsplit_u32(char **buf, const char *delim, u32 **tkns, size_t *num_tkns)
> +{
> +       char *s;
> +       u32 *data, *tmp;
> +       size_t count = 0;
> +       size_t cap = 32;
> +       int ret = 0;
> +
> +       *tkns = NULL;
> +       *num_tkns = 0;
> +       data = kcalloc(cap, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       while ((s = strsep(buf, delim)) != NULL) {
> +               ret = kstrtouint(s, 0, data + count);
> +               if (ret)
> +                       goto exit;
> +               if (++count >= cap) {
> +                       cap *= 2;
> +                       tmp = krealloc(data, cap * sizeof(*data),
> GFP_KERNEL);
> +                       if (!tmp) {
> +                               ret = -ENOMEM;
> +                               goto exit;
> +                       }
> +                       data = tmp;
> +               }
> +       }
> +
> +       if (!count)
> +               goto exit;
> +       *tkns = kmemdup(data, count * sizeof(*data), GFP_KERNEL);
> +       if (*tkns == NULL) {
> +               ret = -ENOMEM;
> +               goto exit;
> +       }
> +       *num_tkns = count;
> +
> +exit:
> +       kfree(data);
> +       return ret;
> +}
> +
> +static int tokenize_input(const char __user *from, size_t count,
> +               loff_t *ppos, u32 **tkns, size_t *num_tkns)
> +{
> +       char *buf;
> +       int ret;
> +
> +       buf = kmalloc(count + 1, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       ret = simple_write_to_buffer(buf, count, ppos, from, count);
> +       if (ret != count) {
> +               ret = ret >= 0 ? -EIO : ret;
> +               goto exit;
> +       }
> +
> +       buf[count] = '\0';
> +       ret = strsplit_u32((char **)&buf, ",", tkns, num_tkns);
> +exit:
> +       kfree(buf);
> +       return ret;
> +}
> +
> +static ssize_t probe_points_read(struct file *file,
> +               char __user *to, size_t count, loff_t *ppos)
> +{
> +       struct snd_sof_dfsentry *dfse = file->private_data;
> +       struct sof_probe_point_desc *desc;
> +       size_t num_desc, len = 0;
> +       char *buf;
> +       int i, ret;
> +
> +       buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       ret = sof_ipc_probe_points_info(dfse->sdev, &desc, &num_desc);
> +       if (ret < 0)
> +               goto exit;
> +
> +       for (i = 0; i < num_desc; i++) {
> +               ret = snprintf(buf + len, PAGE_SIZE - len,
> +                       "Id: %#010x  Purpose: %d  Node id: %#x\n",
> +                       desc[i].buffer_id, desc[i].purpose,
> desc[i].stream_tag);
> +               if (ret < 0)
> +                       goto free_desc;
> +               len += ret;
> +       }
> +
> +       ret = simple_read_from_buffer(to, count, ppos, buf, len);
> +free_desc:
> +       kfree(desc);
> +exit:
> +       kfree(buf);
> +       return ret;
> +}
> +
> +static ssize_t probe_points_write(struct file *file,
> +               const char __user *from, size_t count, loff_t *ppos)
> +{
> +       struct snd_sof_dfsentry *dfse = file->private_data;
> +       struct sof_probe_point_desc *desc;
> +       size_t num_tkns, bytes;
> +       u32 *tkns;
> +       int ret;
> +
> +       ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
> +       if (ret < 0)
> +               return ret;
> +       bytes = sizeof(*tkns) * num_tkns;
> +       if (!num_tkns || (bytes % sizeof(*desc))) {
> +               ret = -EINVAL;
> +               goto exit;
> +       }
> +
> +       desc = (struct sof_probe_point_desc *)tkns;
> +       ret = sof_ipc_probe_points_add(dfse->sdev,
> +                       desc, bytes / sizeof(*desc));
> +       if (!ret)
> +               ret = count;
> +exit:
> +       kfree(tkns);
> +       return ret;
> +}
> +
> +static const struct file_operations probe_points_fops = {
> +       .open = simple_open,
> +       .read = probe_points_read,
> +       .write = probe_points_write,
> +       .llseek = default_llseek,
> +};
> +
> +static ssize_t probe_points_remove_write(struct file *file,
> +               const char __user *from, size_t count, loff_t *ppos)
> +{
> +       struct snd_sof_dfsentry *dfse = file->private_data;
> +       size_t num_tkns;
> +       u32 *tkns;
> +       int ret;
> +
> +       ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
> +       if (ret < 0)
> +               return ret;
> +       if (!num_tkns) {
> +               ret = -EINVAL;
> +               goto exit;
> +       }
> +
> +       ret = sof_ipc_probe_points_remove(dfse->sdev, tkns, num_tkns);
> +       if (!ret)
> +               ret = count;
> +exit:
> +       kfree(tkns);
> +       return ret;
> +}
> +
> +static const struct file_operations probe_points_remove_fops = {
> +       .open = simple_open,
> +       .write = probe_points_remove_write,
> +       .llseek = default_llseek,
> +};
> +
> +static int snd_sof_debugfs_probe_item(struct snd_sof_dev *sdev,
> +                                const char *name, mode_t mode,
> +                                const struct file_operations *fops)

Hi Cezary,

Any particular reason to not use the existing snd_sof_debugfs_buf_item()
and adding a new one that does pretty much the same thing?

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
